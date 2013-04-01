require 'date'

NACIONALIDADES = { 
  "Espanhola"   => "ES", 
  "Espa\361ola" => "ES", 
  "Brasileira"  => "BR", 
  "Cubana"      => "CU", 
  "Brasileiro"  => "BR", 
  "espanhola"   => "ES",
  "Espa\361ol"  => "ES", 
  "cubana"      => "CU", 
  "brasleira"   => "BR", 
  "brasileira"  => "BR", 
  "Chilena"     => "CL", 
  "Argentina"   => "AR", 
  "Mexicana"    => "MX", 
  "Cubano"      => "CU", 
  "senegales"   => "SN",
  "brasielira"  => "BR", 
  "argentina"   => "AR"
}

ISO_3166 = {
  "Brasil"         => "BR",
  "Estados Unidos" => "US",
  "Espa\361a"      => "ES",
  "Venezuela"      => "VE", 
  "Reino Unido"    => "GB",
  "Argentina"      => "AR",
  "Col\364mbia"    => "CO",
  "Uruguay"        => "UY",
  "Canad\341"      => "CA",
  "It\341lia"      => "IT"
}


# ------------------------------------------------------------------------------
# PESSOA
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_pessoa;"
puts
puts "CREATE TABLE b7_pessoa (pessoa_id int, nome varchar(40), sobrenome varchar(100));"
puts

sql = "INSERT INTO b7_pessoa VALUES (%s, \"%s\", \"%s\");"

f=File.new("pessoa.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id     = r[0,10].to_s.gsub(/[^0-9]/, '')
  nome_completo = r[11,255].to_s.strip.gsub(/\"/, '\"')
  nome          = ""
  sobrenome     = ""

  if nome_completo.index(/\s/)
    nome, sobrenome = nome_completo.split(" ", 2)
  end

  if pessoa_id.length > 0 and
     nome.length > 0 and
     sobrenome.length > 0
    d<< sql % [ pessoa_id, nome, sobrenome ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "REPLACE INTO individuals (id, name_first, name_last)"
puts "SELECT pessoa_id, nome, sobrenome FROM b7_pessoa;"


# ------------------------------------------------------------------------------
# EMAIL
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_email;"
puts
puts "CREATE TABLE b7_email (pessoa_id int, local varchar(50), dominio varchar(50));"
puts

sql = "INSERT INTO b7_email VALUES (%s, \"%s\", \"%s\");"

f=File.new("email.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id = r[0,10].to_s.gsub(/[^0-9]/, '')
  email     = r[11,255].to_s.strip.gsub(/\"/, '\"')
  local     = ""
  dominio   = ""

  if email.index(/@/)
    local, dominio = email.split("@", 2)
  end

  if pessoa_id.length > 0 and
     local.length > 0 and
     dominio.length > 0
    d<< sql % [ pessoa_id, local, dominio ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "REPLACE INTO subscribers (individual_id, hash_id, email_local, email_domain)"
puts "SELECT pessoa_id, SHA1(RAND()), local, dominio"
puts "FROM b7_email WHERE pessoa_id IN (SELECT id FROM individuals);"


# ------------------------------------------------------------------------------
# BIOGRAFICO
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_biografico;"
puts
puts "CREATE TABLE b7_biografico (pessoa_id int, nascimento TIMESTAMP, sexo ENUM('male','female'), nacionalidade CHAR(2));"
puts

sql = "INSERT INTO b7_biografico VALUES (%s, %s, %s, %s);"

f=File.new("biografico.txt", "r")

d=Array.new

nacionalidades=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id     = r[0,10].to_s.gsub(/[^0-9]/, '')
  nascimento    = r[11,255].to_s.strip
  sexo          = r[268,10].to_s.strip
  nacionalidade = r[280,255].to_s.strip

  if nascimento.match(/^[0-9]+\/[0-9]+\/[0-9]+/)
    j = nascimento.split(/\//)
    if j.length == 3 and Date.valid_civil?(j[2].to_i, j[1].to_i, j[0].to_i)
      nascimento = Date.parse("#{j[2]}-#{j[1]}-#{j[0]}").strftime("%Y-%m-%d")
    end
  end
  nascimento = nil unless nascimento.match(/^[0-9]+\-[0-9]+\-[0-9]+/)

  nacionalidade = nil if nacionalidade=="NULL" or nacionalidade.to_s.empty?
  nacionalidades<< nacionalidade unless nacionalidade.nil? or pessoa_id.to_s.empty?
  unless nacionalidade.nil?
    nacionalidade = NACIONALIDADES[nacionalidade]
  end

  sexo = nil if sexo=="0" # 0 is ambiguous (null/female)

  if pessoa_id.length > 0 and not (nascimento.nil? and sexo.nil? and nacionalidade.nil?) 
    d<< sql % [ 
      pessoa_id, 
      (nascimento ? "\"#{nascimento}\"" : "NULL"), 
      (sexo ? (sexo=="1" ? "'male'" : "'female'") : "NULL"),
      (nacionalidade ? "\"#{nacionalidade}\"" : "NULL") 
    ]
  end
end

d[0, d.length - 1].each { |j| puts j }

desconhecidos = nacionalidades.uniq - NACIONALIDADES.keys
warn "NACIONALIDADES DESCONHECIDAS: #{desconhecidos.inspect}" if desconhecidos.length > 0

puts "UPDATE individuals,b7_biografico"
puts "SET individuals.birthdate=b7_biografico.nascimento, individuals.gender=b7_biografico.sexo, individuals.citizenship_country=b7_biografico.nacionalidade"
puts "WHERE individuals.id=b7_biografico.pessoa_id;"


# ------------------------------------------------------------------------------
# DOCUMENTO
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_documento;"
puts
puts "CREATE TABLE b7_documento (pessoa_id int, documento VARCHAR(100), tipo VARCHAR(50));"
puts

sql = "INSERT INTO b7_documento VALUES (%s, \"%s\", \"%s\");"

f=File.new("documento.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id = r[0,10].to_s.gsub(/[^0-9]/, '')
  documento = r[24,255].to_s.strip.gsub(/\"/, '\"')
  tipo      = r[280,255].to_s.strip.gsub(/\"/, '\"')

  documento = nil if documento=="NULL" or documento.to_s.empty?
  tipo      = nil if tipo=="NULL" or tipo.to_s.empty?

  if pessoa_id.length > 0 and not documento.nil?
    d<< sql % [ pessoa_id, documento, tipo ]
  end
end

d[0, d.length - 1].each { |j| puts j }

[ "Passaporte", "RG", "CPF" ].each do |j|
  puts "UPDATE individuals,b7_documento"
  puts "SET individuals.document=b7_documento.documento"
  puts "WHERE individuals.id=b7_documento.pessoa_id"
  puts "AND b7_documento.tipo=\"#{j}\";"
end


# ------------------------------------------------------------------------------
# ATUACAO
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_atuacao;"
puts
puts "CREATE TABLE b7_atuacao (pessoa_id int, area VARCHAR(100));"
puts

sql = "INSERT INTO b7_atuacao VALUES (%s, \"%s\");"

f=File.new("atuacao.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id = r[0,10].to_s.gsub(/[^0-9]/, '')
  area      = r[24,255].to_s.strip.gsub(/\"/, '\"')

  area = nil if area=="NULL" or area.to_s.empty?

  if pessoa_id.length > 0 and not area.nil?
    d<< sql % [ pessoa_id, area ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "DELETE FROM individual_activities;"
puts "DELETE FROM personal_activities;"

puts "INSERT INTO personal_activities (name)"
puts "SELECT DISTINCT(area) FROM b7_atuacao;";

puts "INSERT INTO individual_activities"
puts "SELECT b7_atuacao.pessoa_id, personal_activities.id"
puts "FROM b7_atuacao INNER JOIN personal_activities ON personal_activities.name = b7_atuacao.area"
puts "WHERE b7_atuacao.pessoa_id IN (SELECT id FROM individuals);"


# ------------------------------------------------------------------------------
# TELEFONE
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_telefone;"
puts
puts "CREATE TABLE b7_telefone (pessoa_id int, telefone VARCHAR(100), tipo VARCHAR(50));"
puts

sql = "INSERT INTO b7_telefone VALUES (%s, \"%s\", \"%s\");"

f=File.new("telefone.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id = r[0,10].to_s.gsub(/[^0-9]/, '')
  telefone  = r[24,255].to_s.strip.gsub(/\"/, '\"')
  tipo      = r[280,255].to_s.strip.gsub(/\"/, '\"')

  telefone = nil if telefone=="NULL" or telefone.to_s.empty?
  tipo     = nil if tipo=="NULL" or tipo.to_s.empty?

  if pessoa_id.length > 0 and not telefone.nil?
    d<< sql % [ pessoa_id, telefone, tipo ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "DELETE FROM individual_connections;"

{
  'phone_home'     => "telefone residencial",
  'phone_business' => "telefone comercial",
  'phone_mobile'   => "celular",
  'phone_fax'      => "tel / fax",
  'fax_only'       => "fax"
}.each do |j,k|
  puts "INSERT INTO individual_connections (individual_id, connection_type_id, position, value)"
  puts "SELECT b7_telefone.pessoa_id, connection_types.id, 1, b7_telefone.telefone"
  puts "FROM b7_telefone INNER JOIN connection_types ON connection_types.name='#{j}'"
  puts "WHERE b7_telefone.tipo='#{k}'"
  puts "AND b7_telefone.pessoa_id IN (SELECT id FROM individuals);"
end


# ------------------------------------------------------------------------------
# ENDERECO 
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_endereco;"
puts
puts "CREATE TABLE b7_endereco (pessoa_id int, logradouro VARCHAR(200), bairro VARCHAR(100), cidade VARCHAR(100), estado VARCHAR(100), pais_ VARCHAR(100), pais VARCHAR(2), cep VARCHAR(50));"
puts

sql = "INSERT INTO b7_endereco VALUES (%s, \"%s\", %s, \"%s\", %s, \"%s\", \"%s\", %s);"

f=File.new("endereco.txt", "r")

d=Array.new

paises=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id  = r[0,10].to_s.gsub(/[^0-9]/, '')
  logradouro = r[36,255].to_s.strip.gsub(/\"/, '\"')
  bairro     = r[292,255].to_s.strip.gsub(/\"/, '\"')
  cidade     = r[548,255].to_s.strip.gsub(/\"/, '\"')
  cep        = r[817,255].to_s.strip.gsub(/\"/, '\"')

  logradouro = ""  if logradouro=="NULL" or logradouro.empty?
  bairro     = nil if bairro=="NULL" or bairro.empty?
  cidade     = ""  if cidade=="NULL" or cidade.empty?
  estado     = nil
  pais_      = ""
  pais       = ""
  cep        = nil if cep=="NULL" or not cep.to_s.match(/[a-zA-Z0-9]+/)

  cidade_scan = cidade.scan(/\//).length

  if cidade_scan == 3
    pais_, cidade = cidade.split(/\//)[1,2]
  elsif cidade_scan == 4
    pais_, estado, cidade = cidade.split(/\//)[1,3]
  end

  cidade = ""  if cidade.to_s.empty?
  estado = nil if estado.to_s.empty?
  pais_  = ""  if pais_.to_s.empty?

  pais = ISO_3166[pais_] unless pais_.to_s.empty?
  if pais.to_s.empty?
    paises<< pais_  unless pais.to_s.empty?
    pais = "BR"
  end

  if pessoa_id.length > 0 and 
    not logradouro.empty? and 
    not cidade.empty? and 
    not pais.empty?
    d<< sql % [ 
      pessoa_id, 
      logradouro, 
      (bairro.to_s.empty? ? "NULL" : "\"#{bairro}\""), 
      cidade, 
      (estado.to_s.empty? ? "NULL" : "\"#{estado}\""), 
      pais_, 
      pais, 
      (cep.to_s.empty? ? "NULL" : "\"#{cep}\"")
    ]
  end
end

d[0, d.length - 1].each { |j| puts j }

warn "PAISES DESCONHECIDOS: #{paises.uniq.inspect}" if paises.length > 0

puts "REPLACE INTO localizations (id, country, state, city, district, code, address)"
puts "SELECT pessoa_id, pais, estado, cidade, bairro, cep, logradouro"
puts "FROM b7_endereco"
puts "WHERE pessoa_id IN (SELECT id FROM individuals);"

puts "REPLACE INTO individual_localizations (individual_id, localization_id, context)"
puts "SELECT id, id, 'home' FROM localizations;"


# ------------------------------------------------------------------------------
# PESSOA/EMPRESA
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_pessoa_empresa;"
puts
puts "CREATE TABLE b7_pessoa_empresa (pessoa_id int, empresa_id int, empresa VARCHAR(100), cargo VARCHAR(100));"
puts

sql = "INSERT INTO b7_pessoa_empresa VALUES (%s, %s, \"%s\", \"%s\");"

f=File.new("pessoa-empresa.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  pessoa_id  = r[0,10].to_s.gsub(/[^0-9]/, '')
  empresa_id = r[24,10].to_s.gsub(/[^0-9]/, '')
  empresa    = r[36,255].to_s.strip.gsub(/\"/, '\"')
  cargo      = r[304,255].to_s.strip.gsub(/\"/, '\"')

  if pessoa_id.length > 0 and empresa_id.length > 0
    d<< sql % [ pessoa_id, empresa_id, empresa, cargo ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "DELETE FROM job_positions;"
puts "INSERT INTO job_positions (name) SELECT DISTINCT cargo FROM b7_pessoa_empresa;"

puts "REPLACE INTO organizations (id, name)"
puts "SELECT empresa_id, empresa FROM b7_pessoa_empresa;"

puts "REPLACE INTO employments (individual_id, organization_id, job_position_id)"
puts "SELECT pessoa_id, empresa_id, job_positions.id"
puts "FROM b7_pessoa_empresa INNER JOIN job_positions"
puts "ON b7_pessoa_empresa.cargo = job_positions.name"
puts "WHERE pessoa_id IN (SELECT id FROM individuals);"


# ------------------------------------------------------------------------------
# EMPRESA
# ------------------------------------------------------------------------------

puts "DROP TABLE IF EXISTS b7_empresa;"
puts
puts "CREATE TABLE b7_empresa (empresa_id int, nome varchar(100));"
puts

sql = "INSERT INTO b7_empresa VALUES (%s, \"%s\");"

f=File.new("empresa.txt", "r")

d=Array.new

f.each do |line|
  w = line.length
  r = line.to_s.chop

  empresa_id = r[0,10].to_s.gsub(/[^0-9]/, '')
  nome       = r[11,255].to_s.strip.gsub(/\"/, '\"')

  if empresa_id.length > 0 and nome.length > 0
    d<< sql % [ empresa_id, nome ]
  end
end

d[0, d.length - 1].each { |j| puts j }

puts "REPLACE INTO organizations (id, name)"
puts "SELECT empresa_id, nome FROM b7_empresa;"

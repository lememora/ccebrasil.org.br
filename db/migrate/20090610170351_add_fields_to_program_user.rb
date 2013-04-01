class AddFieldsToProgramUser < ActiveRecord::Migration
  
  def self.up
    add_column :program_users, :salt, :string
    add_column :program_users, :nasc_dia, :string
    add_column :program_users, :nasc_mes, :string
    add_column :program_users, :nasc_ano, :string
    add_column :program_users, :sexo, :string
    add_column :program_users, :cpf, :string
    add_column :program_users, :ddd_fixo, :string
    add_column :program_users, :phone_fixo, :string
    add_column :program_users, :ddd_celular, :string
    add_column :program_users, :phone_celular, :string
    add_column :program_users, :end_residencial, :string
    add_column :program_users, :end_residencial_numero, :string
    add_column :program_users, :end_residencial_bairro, :string
    add_column :program_users, :end_residencial_cidade, :string
    add_column :program_users, :end_residencial_estado, :string
    add_column :program_users, :end_residencial_cep, :string
    add_column :program_users, :necessidades_especiais, :string
    add_column :program_users, :cuidados_especiais, :string
    add_column :program_users, :interesses, :string
    add_column :program_users, :nacionalidade, :string
    add_column :program_users, :pais, :string
    add_column :program_users, :passaporte, :string
    add_column :program_users, :instituicao, :string
    add_column :program_users, :cargo, :string
    add_column :program_users, :unidade_de_trabalho, :string
    add_column :program_users, :atividades, :string
  end

  def self.down
    remove_column :program_users, :salt
    remove_column :program_users, :nasc_dia
    remove_column :program_users, :nasc_mes
    remove_column :program_users, :nasc_ano
    remove_column :program_users, :sexo
    remove_column :program_users, :cpf
    remove_column :program_users, :ddd_fixo
    remove_column :program_users, :phone_fixo
    remove_column :program_users, :ddd_celular
    remove_column :program_users, :phone_celular
    remove_column :program_users, :end_residencial
    remove_column :program_users, :end_residencial_numero
    remove_column :program_users, :end_residencial_bairro
    remove_column :program_users, :end_residencial_cidade
    remove_column :program_users, :end_residencial_estado
    remove_column :program_users, :end_residencial_cep
    remove_column :program_users, :necessidades_especiais
    remove_column :program_users, :cuidados_especiais
    remove_column :program_users, :interesses
    remove_column :program_users, :nacionalidade
    remove_column :program_users, :pais
    remove_column :program_users, :passaporte
    remove_column :program_users, :instituicao
    remove_column :program_users, :cargo
    remove_column :program_users, :unidade_de_trabalho
    remove_column :program_users, :atividades
  end
  
end

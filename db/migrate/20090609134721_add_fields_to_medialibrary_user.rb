class AddFieldsToMedialibraryUser < ActiveRecord::Migration
  
  def self.up
    add_column :medialibrary_users, :salt, :string
    add_column :medialibrary_users, :nasc_dia, :string
    add_column :medialibrary_users, :nasc_mes, :string
    add_column :medialibrary_users, :nasc_ano, :string
    add_column :medialibrary_users, :sexo, :string
    add_column :medialibrary_users, :cpf, :string
    add_column :medialibrary_users, :ddd_fixo, :string
    add_column :medialibrary_users, :phone_fixo, :string
    add_column :medialibrary_users, :ddd_celular, :string
    add_column :medialibrary_users, :phone_celular, :string
    add_column :medialibrary_users, :end_residencial, :string
    add_column :medialibrary_users, :end_residencial_numero, :string
    add_column :medialibrary_users, :end_residencial_bairro, :string
    add_column :medialibrary_users, :end_residencial_cidade, :string
    add_column :medialibrary_users, :end_residencial_estado, :string
    add_column :medialibrary_users, :end_residencial_cep, :string
    add_column :medialibrary_users, :necessidades_especiais, :string
    add_column :medialibrary_users, :cuidados_especiais, :string
    add_column :medialibrary_users, :interesses, :string
    add_column :medialibrary_users, :nacionalidade, :string
    add_column :medialibrary_users, :pais, :string
    add_column :medialibrary_users, :passaporte, :string
    add_column :medialibrary_users, :instituicao, :string
    add_column :medialibrary_users, :cargo, :string
    add_column :medialibrary_users, :unidade_de_trabalho, :string
  end

  def self.down
    remove_column :medialibrary_users, :salt
    remove_column :medialibrary_users, :nasc_dia
    remove_column :medialibrary_users, :nasc_mes
    remove_column :medialibrary_users, :nasc_ano
    remove_column :medialibrary_users, :sexo
    remove_column :medialibrary_users, :cpf
    remove_column :medialibrary_users, :ddd_fixo
    remove_column :medialibrary_users, :phone_fixo
    remove_column :medialibrary_users, :ddd_celular
    remove_column :medialibrary_users, :phone_celular
    remove_column :medialibrary_users, :end_residencial
    remove_column :medialibrary_users, :end_residencial_numero
    remove_column :medialibrary_users, :end_residencial_bairro
    remove_column :medialibrary_users, :end_residencial_cidade
    remove_column :medialibrary_users, :end_residencial_estado
    remove_column :medialibrary_users, :end_residencial_cep
    remove_column :medialibrary_users, :necessidades_especiais
    remove_column :medialibrary_users, :cuidados_especiais
    remove_column :medialibrary_users, :interesses
    remove_column :medialibrary_users, :nacionalidade
    remove_column :medialibrary_users, :pais
    remove_column :medialibrary_users, :passaporte
    remove_column :medialibrary_users, :instituicao
    remove_column :medialibrary_users, :cargo
    remove_column :medialibrary_users, :unidade_de_trabalho
  end
  
end

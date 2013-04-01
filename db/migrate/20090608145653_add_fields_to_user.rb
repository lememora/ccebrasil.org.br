class AddFieldsToUser < ActiveRecord::Migration
  
  def self.up
    add_column :users, :deseja_receber, :boolean
    add_column :users, :salt, :string
    add_column :users, :endereco_residencial, :string
    add_column :users, :bairro_residencial, :string
    add_column :users, :cidade_residencial, :string
    add_column :users, :uf_residencial, :string
    add_column :users, :cep_residencial, :string
    add_column :users, :phone_1_number, :string
    add_column :users, :phone_1_kind, :string
    add_column :users, :phone_2_number, :string
    add_column :users, :phone_2_kind, :string
    add_column :users, :homepage, :string
    add_column :users, :atividade_profissional, :string
    add_column :users, :empresa, :string
    add_column :users, :endereco_comercial, :string
    add_column :users, :bairro_comercial, :string
    add_column :users, :cidade_comercial, :string
    add_column :users, :uf_comercial, :string
    add_column :users, :cep_comercial, :string
    add_column :users, :cargo_na_empresa, :string
    add_column :users, :area_atuacao_da_empresa, :string
  end

  def self.down
    remove_column :users, :deseja_receber
    remove_column :users, :salt
    remove_column :users, :endereco_residencial
    remove_column :users, :bairro_residencial
    remove_column :users, :cidade_residencial
    remove_column :users, :uf_residencial
    remove_column :users, :cep_residencial
    remove_column :users, :phone_1_number
    remove_column :users, :phone_1_kind
    remove_column :users, :phone_2_number
    remove_column :users, :phone_2_kind
    remove_column :users, :homepage
    remove_column :users, :atividade_profissional
    remove_column :users, :empresa
    remove_column :users, :endereco_comercial
    remove_column :users, :bairro_comercial
    remove_column :users, :cidade_comercial
    remove_column :users, :uf_comercial
    remove_column :users, :cep_comercial
    remove_column :users, :cargo_na_empresa
    remove_column :users, :area_atuacao_da_empresa
  end
  
end

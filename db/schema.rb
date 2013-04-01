# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090809150333) do

  create_table "aecid_sites", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agendas", :force => true do |t|
    t.string   "title"
    t.string   "where"
    t.string   "when"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "url"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "article_image_file_name"
    t.string   "article_image_content_type"
    t.integer  "article_image_file_size"
    t.string   "permalink"
    t.integer  "position"
    t.string   "image_desc"
    t.boolean  "bolsas_e_convocatorias"
  end

  create_table "calendar_images", :force => true do |t|
    t.integer  "month"
    t.integer  "year"
    t.string   "credits"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "calendar_image_file_name"
    t.string   "calendar_image_content_type"
    t.integer  "calendar_image_file_size"
  end

  create_table "countries", :force => true do |t|
    t.string   "english"
    t.string   "portuguese"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "download_files", :force => true do |t|
    t.string   "title"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highlights", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "highlight_image_file_name"
    t.string   "highlight_image_content_type"
    t.integer  "highlight_image_file_size"
    t.string   "link_txt"
  end

  create_table "journalists", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_additional_images", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "title"
    t.integer  "position"
    t.string   "lf_add_image_file_name"
    t.string   "lf_add_image_content_type"
    t.integer  "lf_add_image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_audios", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "title"
    t.integer  "position"
    t.string   "lf_audio_file_name"
    t.string   "lf_audio_content_type"
    t.integer  "lf_audio_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_categories", :force => true do |t|
    t.string   "category"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_documents", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "title"
    t.integer  "position"
    t.string   "lf_doc_file_name"
    t.string   "lf_doc_content_type"
    t.integer  "lf_doc_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_links", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "categ"
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_texts", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "title"
    t.integer  "position"
    t.string   "lf_txt_file_name"
    t.string   "lf_txt_content_type"
    t.integer  "lf_txt_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_file_videos", :force => true do |t|
    t.integer  "living_file_id"
    t.string   "title"
    t.integer  "position"
    t.text     "embed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "living_files", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.integer  "position"
    t.string   "living_file_file_name"
    t.string   "living_file_image_content_type"
    t.integer  "living_file_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "living_file_category_id"
    t.string   "image_credits"
  end

  create_table "medialibraries", :force => true do |t|
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "title"
    t.string   "link_txt"
  end

  create_table "medialibrary_abouts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medialibrary_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "nasc_dia"
    t.string   "nasc_mes"
    t.string   "nasc_ano"
    t.string   "sexo"
    t.string   "cpf"
    t.string   "ddd_fixo"
    t.string   "phone_fixo"
    t.string   "ddd_celular"
    t.string   "phone_celular"
    t.string   "end_residencial"
    t.string   "end_residencial_numero"
    t.string   "end_residencial_bairro"
    t.string   "end_residencial_cidade"
    t.string   "end_residencial_estado"
    t.string   "end_residencial_cep"
    t.string   "necessidades_especiais"
    t.string   "cuidados_especiais"
    t.string   "interesses"
    t.string   "nacionalidade"
    t.string   "pais"
    t.string   "passaporte"
    t.string   "instituicao"
    t.string   "cargo"
    t.string   "unidade_de_trabalho"
    t.string   "atividades"
  end

  create_table "partner_sites", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "categ"
  end

  create_table "press_documents", :force => true do |t|
    t.integer  "press_kit_id"
    t.string   "title"
    t.integer  "position"
    t.boolean  "protected_file"
    t.string   "presskit_file_name"
    t.string   "presskit_content_type"
    t.integer  "presskit_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "presskit_thumb_file_name"
    t.string   "presskit_thumb_content_type"
    t.integer  "presskit_thumb_file_size"
  end

  create_table "press_kits", :force => true do |t|
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_categories", :force => true do |t|
    t.string   "category"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_downloads", :force => true do |t|
    t.integer  "month"
    t.integer  "year"
    t.string   "program_download_file_name"
    t.string   "program_download_image_content_type"
    t.integer  "program_download_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_generic_attributes", :force => true do |t|
    t.integer  "program_id"
    t.string   "title"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "program_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "nasc_dia"
    t.string   "nasc_mes"
    t.string   "nasc_ano"
    t.string   "sexo"
    t.string   "cpf"
    t.string   "ddd_fixo"
    t.string   "phone_fixo"
    t.string   "ddd_celular"
    t.string   "phone_celular"
    t.string   "end_residencial"
    t.string   "end_residencial_numero"
    t.string   "end_residencial_bairro"
    t.string   "end_residencial_cidade"
    t.string   "end_residencial_estado"
    t.string   "end_residencial_cep"
    t.string   "necessidades_especiais"
    t.string   "cuidados_especiais"
    t.string   "interesses"
    t.string   "nacionalidade"
    t.string   "pais"
    t.string   "passaporte"
    t.string   "instituicao"
    t.string   "cargo"
    t.string   "unidade_de_trabalho"
    t.string   "atividades"
    t.string   "program"
    t.string   "interesses_desc"
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "extract"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "program_image_file_name"
    t.string   "program_mage_icontent_type"
    t.integer  "program_image_file_size"
    t.string   "permalink"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "position"
    t.integer  "program_category_id"
    t.string   "url"
    t.string   "where"
    t.string   "when"
    t.integer  "finish_day"
    t.integer  "finish_month"
    t.integer  "finish_year"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.boolean  "open_to_register"
  end

  create_table "project_additional_images", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "position"
    t.string   "prj_add_image_file_name"
    t.string   "prj_add_image_content_type"
    t.integer  "prj_add_image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_audios", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "position"
    t.string   "prj_audio_file_name"
    t.string   "prj_audio_content_type"
    t.integer  "prj_audio_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_documents", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "position"
    t.string   "prj_doc_file_name"
    t.string   "prj_doc_content_type"
    t.integer  "prj_doc_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_links", :force => true do |t|
    t.integer  "project_id"
    t.string   "categ"
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_texts", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "position"
    t.string   "prj_txt_file_name"
    t.string   "prj_txt_content_type"
    t.integer  "prj_txt_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_videos", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "position"
    t.text     "embed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "project_category_id"
    t.string   "title"
    t.string   "subtitle"
    t.string   "where"
    t.string   "when"
    t.text     "extract"
    t.text     "description"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_image_file_name"
    t.string   "project_image_content_type"
    t.integer  "project_image_file_size"
    t.integer  "position"
    t.string   "image_credits"
  end

  create_table "protected_files", :force => true do |t|
    t.string   "name"
    t.text     "message"
    t.string   "email"
    t.integer  "downloads"
    t.string   "salt"
    t.string   "pf_file_name"
    t.string   "pf_content_type"
    t.integer  "pf_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socialnetwork_sites", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position"
    t.string   "sn_icon_file_name"
    t.string   "sn_icon_image_content_type"
    t.integer  "sn_icon_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deseja_receber"
    t.string   "salt"
    t.string   "endereco_residencial"
    t.string   "bairro_residencial"
    t.string   "cidade_residencial"
    t.string   "uf_residencial"
    t.string   "cep_residencial"
    t.string   "phone_1_number"
    t.string   "phone_1_kind"
    t.string   "phone_2_number"
    t.string   "phone_2_kind"
    t.string   "homepage"
    t.string   "atividade_profissional"
    t.string   "empresa"
    t.string   "endereco_comercial"
    t.string   "bairro_comercial"
    t.string   "cidade_comercial"
    t.string   "uf_comercial"
    t.string   "cep_comercial"
    t.string   "cargo_na_empresa"
    t.string   "area_atuacao_da_empresa"
  end

end

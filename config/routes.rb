ActionController::Routing::Routes.draw do |map|
  
  
  map.connect 'enviar_arquivo_protegido/:id',
    :controller => "protected_files",
    :action => "enviar_arquivo_protegido"
  
  map.connect 'arquivo_protegido/:id/:salt',
    :controller => "home",
    :action => "arquivo_protegido"
  
  map.resources :protected_files
  
  map.resources :journalists
  
  map.connect 'program_users/excel',
     :controller => "program_users",
     :action => "excel"
  
  map.resources :program_users
  
  map.connect 'medialibrary_users/excel',
      :controller => "medialibrary_users",
      :action => "excel"

  map.resources :medialibrary_users

  map.connect 'users/excel',
     :controller => "users",
     :action => "excel"

  map.resources :users
  
  #map.resources :press_kits
  #map.resources :press_documents
  
  map.resources :press_kits do |press_kits|
    press_kits.resources :press_documents, :member => {:higher => :put, :lower => :put}
  end
  
  map.connect 'press_kits/:id/higher',
    :controller => "press_kits",
    :action => "higher",
    :method => :put
    
  map.connect 'press_kits/:id/lower',
    :controller => "press_kits",
    :action => "lower",
    :method => :put

  map.resources :download_files
          
  map.resources :living_file_categories

  map.resources :medialibrary_abouts
  
  #map.resources :living_files
  #map.resources :living_file_additional_images
  #map.resources :living_file_videos
  #map.resources :living_file_links
  #map.resources :living_file_documents
  #map.resources :living_file_audios
  #map.resources :living_file_texts
  
  map.resources :living_files do |living_files|
    living_files.resources :living_file_additional_images, :member => {:higher => :put, :lower => :put}
    living_files.resources :living_file_videos, :member => {:higher => :put, :lower => :put}
    living_files.resources :living_file_links, :member => {:higher => :put, :lower => :put}
    living_files.resources :living_file_documents, :member => {:higher => :put, :lower => :put}
    living_files.resources :living_file_audios, :member => {:higher => :put, :lower => :put}
    living_files.resources :living_file_texts, :member => {:higher => :put, :lower => :put}
  end
  
  map.connect 'living_files/:id/higher',
    :controller => "living_files",
    :action => "higher",
    :method => :put
    
  map.connect 'living_files/:id/lower',
    :controller => "living_files",
    :action => "lower",
    :method => :put
  
  map.resources :aecid_sites
  
  map.connect 'aecid_sites/:id/higher',
    :controller => "aecid_sites",
    :action => "higher",
    :method => :put
    
  map.connect 'aecid_sites/:id/lower',
    :controller => "aecid_sites",
    :action => "lower",
    :method => :put
  
  map.resources :partner_sites
  
  map.connect 'partner_sites/:id/higher',
    :controller => "partner_sites",
    :action => "higher",
    :method => :put
    
  map.connect 'partner_sites/:id/lower',
    :controller => "partner_sites",
    :action => "lower",
    :method => :put
  
  map.resources :socialnetwork_sites
  
  map.connect 'socialnetwork_sites/:id/higher',
    :controller => "socialnetwork_sites",
    :action => "higher",
    :method => :put
    
  map.connect 'socialnetwork_sites/:id/lower',
    :controller => "socialnetwork_sites",
    :action => "lower",
    :method => :put
  
  map.resources :program_downloads
  
  map.resources :program_categories

  map.resources :calendar_images  
   
  #map.resources :projects
  #map.resources :project_additional_images 
  #map.resources :project_videos
  #map.resources :project_texts
  #map.resources :project_documents
  #map.resources :project_audios
  #map.resources :project_links
  
  map.resources :projects do |projects|
    projects.resources :project_additional_images, :member => {:higher => :put, :lower => :put}
    projects.resources :project_videos, :member => {:higher => :put, :lower => :put}
    projects.resources :project_texts, :member => {:higher => :put, :lower => :put}
    projects.resources :project_documents, :member => {:higher => :put, :lower => :put}
    projects.resources :project_audios, :member => {:higher => :put, :lower => :put}
    projects.resources :project_links, :member => {:higher => :put, :lower => :put}
  end
  
  map.connect 'projects/:id/higher',
    :controller => "projects",
    :action => "higher",
    :method => :put
    
  map.connect 'projects/:id/lower',
    :controller => "projects",
    :action => "lower",
    :method => :put

  map.resources :project_categories
  
  map.resources :highlights

  map.resources :medialibraries
  
  map.connect 'medialibraries/:id/higher',
    :controller => "medialibraries",
    :action => "higher",
    :method => :put
    
  map.connect 'medialibraries/:id/lower',
    :controller => "medialibraries",
    :action => "lower",
    :method => :put
  
  map.resources :articles
  
  map.connect 'articles/:id/higher',
    :controller => "articles",
    :action => "higher",
    :method => :put
    
  map.connect 'articles/:id/lower',
    :controller => "articles",
    :action => "lower",
    :method => :put
  
  map.resources :agendas  
  
  map.connect 'agendas/:id/higher',
    :controller => "agendas",
    :action => "higher",
    :method => :put
    
  map.connect 'agendas/:id/lower',
    :controller => "agendas",
    :action => "lower",
    :method => :put

  map.resources :programs
  
  map.connect 'programs/:id/higher',
    :controller => "programs",
    :action => "higher",
    :method => :put
    
  map.connect 'programs/:id/lower',
    :controller => "programs",
    :action => "lower",
    :method => :put
  
  map.resources :sessions
  
  map.with_options(:controller => "sessions") do |sessions|
    sessions.login "/login", :action => "new"
    sessions.logout "/logout", :action => "destroy"
    sessions.login_imprensa "/login_imprensa", :action => "login_journalist"
    sessions.logout_imprensa "/logout_imprensa", :action => "logout_journalist"
  end
  
  map.resources :editors
      
  map.with_options(:controller => "home") do |home|
    home.sobre "/sobre", :action => "sobre"
    home.atuacao "/atuacao", :action => "atuacao"
    home.aecid "/aecid", :action => "aecid"
    home.aecid_documentos "/aecid/documentos", :action => "aecid_documentos"
    home.aecid_cultura_desenvolvimento "/aecid/cultura_desenvolvimento", :action => "aecid_cultura_desenvolvimento"
    home.aecid_centros "/aecid/centros", :action => "aecid_centros"
    home.aecid_oficina_tecnica "/aecid/oficina_tecnica", :action => "aecid_oficina_tecnica"
    home.contato "/contato", :action => "contato"
    home.cadastro "/cadastro", :action => "cadastro"
    home.remover_email "/remover_email/:id/:salt", :action => "remover_email"
    home.enviar_mensagem "/enviar_mensagem", :action => "enviar_mensagem"
    home.mapa "/mapa", :action => "mapa"
    home.imprensa "/imprensa", :action => "imprensa"
    home.programacao "/programacao", :action => "programacao", :year => :nil, :month => nil, :day => nil    
    home.programacao "/programacao/categoria/:category", :action => "programacao", :year => :nil, :month => nil, :day => nil
    home.programacao "/programacao/categoria/:category/:year/:month/:day", :action => "programacao", :permalink => nil
    home.programacao "/programa/:id/:permalink", :action => "programa", :category => nil 
    home.programacao "/programacao/:year/:month/:day", :action => "programacao", :category => nil, :permalink => nil
    home.programacao "/programacao/:year/:month/:day/:permalink", :action => "programacao", :category => nil 
    home.programacao_inscricoes "/programacao/inscricoes", :action => "programacao_inscricoes"
    home.arquivo_vivo "/arquivo_vivo", :action => "arquivo_vivo", :permalink => nil  
    home.arquivo_vivo "/arquivo_vivo/:permalink", :action => "arquivo_vivo"
    home.arquivo_vivo "/arquivo_vivo/categoria/:permalink/palavra_chave/:keyword", :action => "arquivo_vivo_busca"
    #home.projetos "/projetos", :action => "projetos"
    home.projetos "/projetos", :action => "projetos_categoria", :category => nil
    home.projetos_categoria "/projetos/categoria/:category", :action => "projetos_categoria"
    home.projetos_categoria "/projetos/todos", :action => "projetos_categoria", :category => nil    
    home.projeto "/projeto/:permalink", :action => "projeto"
    home.midiateca "/midiateca", :action => "midiateca"
    home.midiateca_servicos "/midiateca/servicos", :action => "midiateca_servicos"
    home.midiateca_link "/midiateca/links", :action => "midiateca_link"
    home.midiateca_contato "/midiateca/contato", :action => "midiateca_contato"
    home.midiateca_inscricoes "/midiateca/inscricoes", :action => "midiateca_inscricoes"
    home.links "/links", :action => "links"
    home.noticias "/noticias", :action => "noticias"
    home.bolsas_e_convocatorias "/bolsas_e_convocatorias", :action => "bolsas_e_convocatorias"
    home.noticia "/noticia/:permalink", :action => "noticia"
    home.acessibilidade "/acessibilidade", :action => "acessibilidade"
    home.termos_de_uso "/termos_de_uso", :action => "termos_de_uso"
    home.projeto_dispositivo "/projeto_dispositivo", :action => "projeto_dispositivo"
    home.busca "/busca", :action => "busca"
    home.feed_home "/home/feed", :action => "feed", :method => :get, :format => :rss
  end
  
  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end

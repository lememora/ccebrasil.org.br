class HomeController < ApplicationController
  
  def index
     @programs = Program.find(:all, :order => :position, :limit => 6)
     @highlight = Highlight.find(:first)
     @agendas = Agenda.find(:all, :order => :position, :limit => 3)
     @medialibraries = Medialibrary.find(:all, :order => :position, :limit => 2)
     @article = Article.find(:first, :order => :position)
  end
  
  def feed
    index
  end
  
  def sobre
    @page_title = "Sobre o CCE_SP - Centro Cultural da Espanha_SP"
  end
  
  def atuacao
    @page_title = "Sobre o CCE_SP - Atuação - Centro Cultural da Espanha_SP"
  end
  
  def aecid
    @page_title = "AECID - Centro Cultural da Espanha_SP"
  end
  
  def aecid_documentos
    @page_title = "AECID - Documentos Programáticos - Centro Cultural da Espanha_SP"
  end
  
  def aecid_cultura_desenvolvimento
    @page_title = "AECID - Culturae Desenvolvimento - Centro Cultural da Espanha_SP"
  end
  
  def aecid_centros
    @page_title = "AECID - Rede de Centros - Centro Cultural da Espanha_SP"
  end
  
  def aecid_oficina_tecnica
    @page_title = "AECID - Oficina Técnica de Cooperação - Centro Cultural da Espanha_SP"
  end
    
  def contato
    @page_title = "Contato - Centro Cultural da Espanha_SP"
  end
  
  def enviar_mensagem    
    name = params[:form_nome]
    email = params[:form_email]
    subject = params[:form_assunto]
    message = params[:form_mensagem]
    flash[:mail_notice] = "Mensagem enviada com sucesso!"
    ContactMail.deliver_contact_message(name, email, subject, message)
    redirect_to("/contato")
  end
  
  def cadastro
    @page_title = "Cadastro - Centro Cultural da Espanha_SP"
  end
  
  def novo_usuario
    @user = User.new(params[:user])
    if @user.save
      flash[:novo_usuario] = 'Cadastro efetuado com sucesso.'
    else
      flash[:novo_usuario] = 'Erro no cadastro.'
    end
    redirect_to "/cadastro"
  end
  
  def remove_usuario
    email = params[:user][:email]
    @user = User.find_by_email(email)
    if @user.nil?
      flash[:remove_usuario] = "#{email} - email não registrado"
    else
      flash[:remove_usuario] = "Aguarde email com instruções"
      subject = "CCE_SP - Remover email da newsletter"
      ContactMail.deliver_remove_email_from_database(@user.name, @user.email, subject, @user.id, @user.salt)
    end
    redirect_to "/cadastro"
  end
  
  def remover_email
    @user = User.find(params[:id])
    unless @user.nil?
      if @user.salt == params[:salt]
        @user.destroy
        @message = "Usuário removido"
      else
        @message = "Dados inválidos"
      end
    else
      @message = "Dados inválidos"
    end
  end
  
  def mapa
    @page_title = "Mapa do Site - Centro Cultural da Espanha_SP"
  end
  
  def imprensa
    @page_title = "Imprensa - Centro Cultural da Espanha_SP"
    @press_kits = PressKit.find(:all, :order => :position)
  end
  
  def programacao
    @permalink = params[:permalink]
    @category = params[:category]
    if params[:year].nil? or params[:month].nil? or params[:day].nil?
      year = Time.now.year
      month = Time.now.month
      day = Time.now.day
      if @category.nil?
        redirect_to "/programacao/#{year}/#{month}/#{day}"
      else
        day = 1
        redirect_to "/programacao/categoria/#{@category}/#{year}/#{month}/#{day}"
      end
    else      
      @years = Program.find(:all, :select => " DISTINCT year", :order => "year DESC")
      @year = params[:year].to_i
      @month = params[:month].to_i
      @day = params[:day].to_i
      @page_title = "Programação #{@month}/#{@year} - Centro Cultural da Espanha_SP"
      @calendar_image = CalendarImage.find_last_by_month_and_year(@month, @year)  
      @program_categories = ProgramCategory.find(:all, :order => :category)    
      @program_downloads = ProgramDownload.find(:all, :order => "year DESC, month")    
      if @category.nil?         
        @programs = Program.find(:all, :conditions => [ " '#{@year}-#{@month}-#{@day}  12:00:00' BETWEEN start_date AND finish_date OR finish_date > '#{@year}-#{@month}-#{@day}  12:00:00' AND month <= #{@month} " ], :order => :start_date) 
        if @permalink.nil?      
          @program = nil
        else
          @program = Program.find_by_permalink(@permalink)
        end
      else
        @program = nil
        @program_category = ProgramCategory.find_by_permalink(@category)
        @programs =  @program_category.programs.find(:all, :conditions => [ " '#{@year}-#{@month}-#{@day}  12:00:00' BETWEEN start_date AND finish_date OR finish_date > '#{@year}-#{@month}-#{@day}  12:00:00' AND month <= #{@month} " ], :order => :start_date) 
      end            
    end
  end  
  
  def programa    
    program = Program.find(params[:id])
    if program.nil?
      year = Time.now.year
      month = Time.now.month
      day = Time.now.day
    else
      year = program.year
      month = program.month
      day = 1
    end
    redirect_to "/programacao/#{year}/#{month}/#{day}/#{program.permalink}"
  end
  
  def programacao_inscricoes
    @page_title = "Programação - Inscrições - Centro Cultural da Espanha_SP"
    @countries = Country.find(:all, :order => :english).collect { |c| [ c.english, c.english ]}
    @program_categories = ProgramCategory.find(:all, :order => :category).collect { |c| [ c.category, c.category ]}
    @open_programs = Program.find(:all, :order => :title, :conditions => [ "open_to_register = true "] ).collect { |p| [ p.title, p.title ]}
  end
  
  def novo_usuario_programacao
    @program_user = ProgramUser.new(params[:program_user])
    if @program_user.save
      flash[:novo_usuario] = 'Cadastro efetuado com sucesso.'
    else
      flash[:novo_usuario] = 'Erro no cadastro.'
    end
    redirect_to "/programacao/inscricoes"
  end
  
  def arquivo_vivo
    permalink = params[:permalink]
    if permalink.nil?
      @living_file = LivingFile.find(:first, :order => :position)
      redirect_to "/arquivo_vivo/#{@living_file.permalink}"
    else      
      @living_file = LivingFile.find_by_permalink(permalink)
      @page_title = "Arquivo Vivo - #{@living_file.title} - Centro Cultural da Espanha_SP"
    end
    @living_file_categories = LivingFileCategory.find(:all, :order => :category)
  end
  
  def arquivo_vivo_busca
    permalink = params[:permalink]
    keyword = params[:keyword]
    @page_title = "Arquivo Vivo - Centro Cultural da Espanha_SP"
    if permalink.nil? or permalink == "todas"
      if keyword.nil? or keyword == "todas"
        @living_files = LivingFile.find(:all, :order => :position)
      else
         @living_files = LivingFile.find(:all, :conditions => [ "title like ?", "%#{keyword}%"], :order => :position)
      end
    else
      living_file_category = LivingFileCategory.find_by_permalink(permalink)
      if living_file_category.nil?
        redirect_to "arquivo_vivo/categoria/todas/palavra_chave/#{keyword}"
      else
        if keyword.nil? or keyword == "todas"
          @living_files = living_file_category.living_files.find(:all, :order => :position)
        else
           @living_files = living_file_category.living_files.find(:all, :conditions => [ "title like ?", "%#{keyword}%"], :order => :position)
        end
      end
    end    
    @living_file_categories = LivingFileCategory.find(:all, :order => :category)
  end
  
  def projetos
    @page_title = "Projetos - Centro Cultural da Espanha_SP"
    @project_categories = ProjectCategory.find(:all)
    @proj_cult = Project.find(:first, :conditions => " project_category_id = 1", :order => :position)
    #proj_todos_pos = @proj_cult.position
    @proj_coop = Project.find(:first, :conditions => " project_category_id = 2", :order => :position)
    #proj_todos_pos = @proj_coop.position unless @proj_coop.position < proj_todos_pos
    @proj_promo = Project.find(:first, :conditions => " project_category_id = 3", :order => :position)
    #proj_todos_pos = @proj_promo.position unless @proj_promo.position < proj_todos_pos
    #proj_todos_pos = proj_todos_pos + 1
    #@proj_todos = Project.find(:first, :conditions => " position = #{proj_todos_pos}" )    
  end
  
  def projetos_categoria
    category = params[:category]
    @project_categories = ProjectCategory.find(:all)
    if category.nil?
      @projects = Project.find(:all, :order => :position)
      @page_title = "Projetos - Centro Cultural da Espanha_SP"
    else      
      @project_category = ProjectCategory.find_by_permalink(category)
      @projects = @project_category.projects.find(:all, :order => :position)
      @page_title = "Projetos - #{@project_category.title} -Centro Cultural da Espanha_SP"
    end
  end
  
  def projeto
    @project_categories = ProjectCategory.find(:all)
    @project = Project.find_by_permalink(params[:permalink])
    @page_title = "Projetos - #{@project.title} -Centro Cultural da Espanha_SP"
  end
  
  def midiateca
    @page_title = "Midiateca - Centro Cultural da Espanha_SP"
  end
  
  def midiateca_servicos
    @page_title = "Midiateca - Serviços - Centro Cultural da Espanha_SP"
  end
    
  def midiateca_link
    @page_title = "Midiateca - Links - Centro Cultural da Espanha_SP"
  end
  
  def midiateca_contato
    @page_title = "Midiateca - Contato - Centro Cultural da Espanha_SP"
  end
  
  def enviar_mensagem_midiateca
    name = params[:form_nome]
    email = params[:form_email]
    subject = params[:form_assunto]
    message = params[:form_mensagem]
    flash[:mail_notice] = "Mensagem enviada com sucesso!"
    ContactMail.deliver_contact_message_midiateca(name, email, subject, message)
    redirect_to("/midiateca/contato")
  end
  
  def midiateca_inscricoes
    @page_title = "Midiateca - Inscrições - Centro Cultural da Espanha_SP"
    @countries = Country.find(:all, :order => :english).collect { |c| [ c.english, c.english ]}
    @program_categories = ProgramCategory.find(:all, :order => :category).collect { |c| [ c.category, c.category ]}
  end
  
  def novo_usuario_midiateca
    @medialibrary_user = MedialibraryUser.new(params[:medialibrary_user])
    if @medialibrary_user.save
      flash[:novo_usuario] = 'Cadastro efetuado com sucesso.'
    else
      flash[:novo_usuario] = 'Erro no cadastro.'
    end
    redirect_to "/midiateca/inscricoes"
  end
  
  def links
    @page_title = "Links - Centro Cultural da Espanha_SP"
    @socialnetwork_sites = SocialnetworkSite.find(:all, :order => :position)
    @partner_sites = PartnerSite.find(:all, :order => :position)
    @aecid_sites = AecidSite.find(:all, :order => :position)
  end
  
  def noticias
    @page_title = "Notícias - Centro Cultural da Espanha_SP"
    @multipage =  Article.find(:all).size > 5
    @articles = Article.find(:all, :order => :position).paginate :page => params[:page], :per_page => 5
  end
  
  def bolsas_e_convocatorias
    @page_title = "Bolsas e Convocatórias - Centro Cultural da Espanha_SP"
    @multipage =  Article.find(:all, :conditions => [ "bolsas_e_convocatorias = true" ]).size > 5
    @articles = Article.find(:all, :conditions => [ "bolsas_e_convocatorias = true" ] ,:order => :position).paginate :page => params[:page], :per_page => 5
  end
  
  def noticia
    @article = Article.find_by_permalink(params[:permalink])
    @page_title = "Notícia - #{@article.title} - Centro Cultural da Espanha_SP"
  end
  
  def acessibilidade
    @page_title = "Acessibilidade - Centro Cultural da Espanha_SP"
  end
  
  def termos_de_uso
    @page_title = "Termos de Uso - Centro Cultural da Espanha_SP"
  end
  
  def projeto_dispositivo
    @page_title = "Projeto Dispositivo - Centro Cultural da Espanha_SP"
  end
  
  def busca
    @keyword = params[:keyword]
    @page_title = "Busca - Resultados para: #{@keyword} - Centro Cultural da Espanha_SP"
    @articles_size = Article.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).size
    @articles = Article.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).paginate :page => params[:page], :per_page => 5
    @programs_size = Program.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).size
    @programs = Program.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).paginate :page => params[:page], :per_page => 5 
    @projects_size = Project.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).size
    @projects = Project.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).paginate :page => params[:page], :per_page => 5 
    @living_files_size = LivingFile.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).size
    @living_files = LivingFile.find(:all, :conditions => [ "title like ? OR description like ?", "%#{@keyword}%", "%#{@keyword}%"], :group => :id, :order => :position).paginate :page => params[:page], :per_page => 5
  end
  
  def arquivo_protegido
    @protected_file = ProtectedFile.find(params[:id])
    unless @protected_file.nil?
      if @protected_file.salt == params[:salt]
        @mensagem = "aguarde o início do download..."
        downloads = @protected_file.downloads.to_i
        downloads = downloads + 1
        @protected_file.update_attribute(:downloads, downloads)
        send_file  "#{RAILS_ROOT}/public/#{@protected_file.pf.url}", :disposition => 'attachment'
      else
        @mensagem = "dados inválidos"
      end
    else
      @mensagem = "dados inválidos"
    end
  end
  
end

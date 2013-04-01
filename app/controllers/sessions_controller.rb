class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    editor = authenticate(params[:email], params[:password])
    if editor.nil?
      flash[:notice] = "Dados inválidos"
      render :action => :new
    else      
      session[:locale] = "pt-BR"
      session[:editor_id] = editor.id
      session[:editor_nm] = editor.name
      redirect_to session[:return_to]
    end
  end
  
  def destroy
     session[:editor_id] = nil
     session[:editor_nm] = ""
     flash[:notice] = ""
     redirect_to login_path
   end
   
   def login_journalist
     journalist = authenticate_journalist(params[:email], params[:password])
     if journalist.nil?
       flash[:journalist_notice] = "Dados inválidos"
     else      
       session[:locale] = "pt-BR"
       session[:journalist_id] = journalist.id
       session[:journalist_nm] = journalist.name       
     end
     redirect_to "/imprensa"
   end

   def logout_journalist
      session[:journalist_id] = nil
      session[:journalist_nm] = ""
      flash[:journalist_notice] = ""
      redirect_to "/imprensa"
    end
   
   protected

    def authenticate(email, password)
      e = Editor.find(:first, :conditions=>["email = ?", email])
      return nil if e.nil?
      return e if Editor.encrypt(password)==e.password
      nil
    end
    
    def authenticate_journalist(email, password)
      j = Journalist.find(:first, :conditions=>["email = ?", email])
      return nil if j.nil?
      return j if Journalist.encrypt(password)==j.password
      nil
    end
  
end

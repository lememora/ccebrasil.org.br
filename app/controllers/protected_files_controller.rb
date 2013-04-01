class ProtectedFilesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /protected_files
  # GET /protected_files.xml
  def index
    @protected_files = ProtectedFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @protected_files }
    end
  end

  # GET /protected_files/1
  # GET /protected_files/1.xml
  def show
    @protected_file = ProtectedFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @protected_file }
    end
  end

  # GET /protected_files/new
  # GET /protected_files/new.xml
  def new
    @protected_file = ProtectedFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @protected_file }
    end
  end

  # GET /protected_files/1/edit
  def edit
    @protected_file = ProtectedFile.find(params[:id])
  end

  # POST /protected_files
  # POST /protected_files.xml
  def create
    @protected_file = ProtectedFile.new(params[:protected_file])

    respond_to do |format|
      if @protected_file.save
        flash[:notice] = 'ProtectedFile was successfully created.'
        format.html { redirect_to(@protected_file) }
        format.xml  { render :xml => @protected_file, :status => :created, :location => @protected_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @protected_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /protected_files/1
  # PUT /protected_files/1.xml
  def update
    @protected_file = ProtectedFile.find(params[:id])

    respond_to do |format|
      if @protected_file.update_attributes(params[:protected_file])
        flash[:notice] = 'ProtectedFile was successfully updated.'
        format.html { redirect_to(@protected_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @protected_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /protected_files/1
  # DELETE /protected_files/1.xml
  def destroy
    @protected_file = ProtectedFile.find(params[:id])
    @protected_file.destroy

    respond_to do |format|
      format.html { redirect_to(protected_files_url) }
      format.xml  { head :ok }
    end
  end
  
  def enviar_arquivo_protegido   
    @protected_file = ProtectedFile.find(params[:id])
    flash[:mail_notice] = "Arquivo enviado!"
    ContactMail.deliver_send_protected_file(@protected_file.email, @protected_file.message, @protected_file.id, @protected_file.salt)
    redirect_to("/protected_files")
  end
  
end

class ProgramDownloadsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /program_downloads
  # GET /program_downloads.xml
  def index
    @program_downloads = ProgramDownload.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @program_downloads }
    end
  end

  # GET /program_downloads/new
  # GET /program_downloads/new.xml
  def new
    @program_download = ProgramDownload.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program_download }
    end
  end

  # GET /program_downloads/1/edit
  def edit
    @program_download = ProgramDownload.find(params[:id])
  end

  # POST /program_downloads
  # POST /program_downloads.xml
  def create
    @program_download = ProgramDownload.new(params[:program_download])

    respond_to do |format|
      if @program_download.save
        flash[:notice] = 'ProgramDownload was successfully created.'
        format.html { redirect_to(program_downloads_url) }
        format.xml  { render :xml => @program_download, :status => :created, :location => @program_download }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @program_download.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /program_downloads/1
  # PUT /program_downloads/1.xml
  def update
    @program_download = ProgramDownload.find(params[:id])

    respond_to do |format|
      if @program_download.update_attributes(params[:program_download])
        flash[:notice] = 'ProgramDownload was successfully updated.'
        format.html { redirect_to(program_downloads_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @program_download.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /program_downloads/1
  # DELETE /program_downloads/1.xml
  def destroy
    @program_download = ProgramDownload.find(params[:id])
    @program_download.destroy

    respond_to do |format|
      format.html { redirect_to(program_downloads_url) }
      format.xml  { head :ok }
    end
  end
end

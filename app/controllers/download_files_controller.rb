class DownloadFilesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /download_files
  # GET /download_files.xml
  def index
    @download_files = DownloadFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @download_files }
    end
  end


  # GET /download_files/new
  # GET /download_files/new.xml
  def new
    @download_file = DownloadFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @download_file }
    end
  end

  # GET /download_files/1/edit
  def edit
    @download_file = DownloadFile.find(params[:id])
  end

  # POST /download_files
  # POST /download_files.xml
  def create
    @download_file = DownloadFile.new(params[:download_file])

    respond_to do |format|
      if @download_file.save
        flash[:notice] = 'DownloadFile was successfully created.'
        format.html { redirect_to(download_files_url)  }
        format.xml  { render :xml => @download_file, :status => :created, :location => @download_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @download_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /download_files/1
  # PUT /download_files/1.xml
  def update
    @download_file = DownloadFile.find(params[:id])

    respond_to do |format|
      if @download_file.update_attributes(params[:download_file])
        flash[:notice] = 'DownloadFile was successfully updated.'
        format.html { redirect_to(download_files_url)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @download_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /download_files/1
  # DELETE /download_files/1.xml
  def destroy
    @download_file = DownloadFile.find(params[:id])
    @download_file.destroy

    respond_to do |format|
      format.html { redirect_to(download_files_url) }
      format.xml  { head :ok }
    end
  end
end

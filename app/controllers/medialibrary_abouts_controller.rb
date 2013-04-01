class MedialibraryAboutsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /medialibrary_abouts
  # GET /medialibrary_abouts.xml
  def index
    @medialibrary_abouts = MedialibraryAbout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medialibrary_abouts }
    end
  end

  # GET /medialibrary_abouts/1
  # GET /medialibrary_abouts/1.xml
  def show
    @medialibrary_about = MedialibraryAbout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medialibrary_about }
    end
  end

  # GET /medialibrary_abouts/new
  # GET /medialibrary_abouts/new.xml
  def new
    @medialibrary_about = MedialibraryAbout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medialibrary_about }
    end
  end

  # GET /medialibrary_abouts/1/edit
  def edit
    @medialibrary_about = MedialibraryAbout.find(params[:id])
  end

  # POST /medialibrary_abouts
  # POST /medialibrary_abouts.xml
  def create
    @medialibrary_about = MedialibraryAbout.new(params[:medialibrary_about])

    respond_to do |format|
      if @medialibrary_about.save
        flash[:notice] = 'MedialibraryAbout was successfully created.'
        format.html { redirect_to(@medialibrary_about) }
        format.xml  { render :xml => @medialibrary_about, :status => :created, :location => @medialibrary_about }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medialibrary_about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medialibrary_abouts/1
  # PUT /medialibrary_abouts/1.xml
  def update
    @medialibrary_about = MedialibraryAbout.find(params[:id])

    respond_to do |format|
      if @medialibrary_about.update_attributes(params[:medialibrary_about])
        flash[:notice] = 'MedialibraryAbout was successfully updated.'
        format.html { redirect_to(@medialibrary_about) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medialibrary_about.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medialibrary_abouts/1
  # DELETE /medialibrary_abouts/1.xml
  def destroy
    @medialibrary_about = MedialibraryAbout.find(params[:id])
    @medialibrary_about.destroy

    respond_to do |format|
      format.html { redirect_to(medialibrary_abouts_url) }
      format.xml  { head :ok }
    end
  end
end

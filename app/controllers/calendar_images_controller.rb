class CalendarImagesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /calendar_images
  # GET /calendar_images.xml
  def index
    @calendar_images = CalendarImage.find(:all, :order => "year DESC, month")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendar_images }
    end
  end

  # GET /calendar_images/1
  # GET /calendar_images/1.xml
  def show
    @calendar_image = CalendarImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendar_image }
    end
  end

  # GET /calendar_images/new
  # GET /calendar_images/new.xml
  def new
    @calendar_image = CalendarImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar_image }
    end
  end

  # GET /calendar_images/1/edit
  def edit
    @calendar_image = CalendarImage.find(params[:id])
  end

  # POST /calendar_images
  # POST /calendar_images.xml
  def create
    @calendar_image = CalendarImage.new(params[:calendar_image])

    respond_to do |format|
      if @calendar_image.save
        flash[:notice] = 'CalendarImage was successfully created.'
        format.html { redirect_to(@calendar_image) }
        format.xml  { render :xml => @calendar_image, :status => :created, :location => @calendar_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendar_images/1
  # PUT /calendar_images/1.xml
  def update
    @calendar_image = CalendarImage.find(params[:id])

    respond_to do |format|
      if @calendar_image.update_attributes(params[:calendar_image])
        flash[:notice] = 'CalendarImage was successfully updated.'
        format.html { redirect_to(@calendar_image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_images/1
  # DELETE /calendar_images/1.xml
  def destroy
    @calendar_image = CalendarImage.find(params[:id])
    @calendar_image.destroy

    respond_to do |format|
      format.html { redirect_to(calendar_images_url) }
      format.xml  { head :ok }
    end
  end
end

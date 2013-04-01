class LivingFileAdditionalImagesController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_additional_images
  # GET /living_file_additional_images.xml
  def index
    @living_file_additional_images = @living_file.living_file_additional_images.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_additional_images }
    end
  end


  # GET /living_file_additional_images/new
  # GET /living_file_additional_images/new.xml
  def new
    @living_file_additional_image = @living_file.living_file_additional_images.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_additional_image }
    end
  end

  # GET /living_file_additional_images/1/edit
  def edit
    @living_file_additional_image = @living_file.living_file_additional_images.find(params[:id])
  end

  # POST /living_file_additional_images
  # POST /living_file_additional_images.xml
  def create
    @living_file_additional_image = @living_file.living_file_additional_images.new(params[:living_file_additional_image])

    respond_to do |format|
      if @living_file_additional_image.save
        flash[:notice] = 'LivingFileAdditionalImage was successfully created.'
        format.html { redirect_to living_file_living_file_additional_images_url(@living_file) }
        format.xml  { render :xml => @living_file_additional_image, :status => :created, :location => @living_file_additional_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_additional_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_additional_images/1
  # PUT /living_file_additional_images/1.xml
  def update
    @living_file_additional_image = @living_file.living_file_additional_images.find(params[:id])

    respond_to do |format|
      if @living_file_additional_image.update_attributes(params[:living_file_additional_image])
        flash[:notice] = 'LivingFileAdditionalImage was successfully updated.'
        format.html { redirect_to living_file_living_file_additional_images_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_additional_image.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_additional_images/1/higher
   def higher
     living_file_additional_image = @living_file.living_file_additional_images.find(params[:id])
     unless living_file_additional_image.nil?
       if living_file_additional_image.first?
         living_file_additional_image.move_to_bottom
       else
         living_file_additional_image.move_higher
       end
     end
     redirect_to living_file_living_file_additional_images_url(@living_file)
   end

   # PUT /living_file_additional_images/1/lower
   def lower
     living_file_additional_image = @living_file.living_file_additional_images.find(params[:id])
     unless living_file_additional_image.nil?
       if living_file_additional_image.last?
        living_file_additional_image.move_to_top
       else
        living_file_additional_image.move_lower
       end
     end
     redirect_to living_file_living_file_additional_images_url(@living_file)
   end

  # DELETE /living_file_additional_images/1
  # DELETE /living_file_additional_images/1.xml
  def destroy
    @living_file_additional_image = @living_file.living_file_additional_images.find(params[:id])
    @living_file_additional_image.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_additional_images_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_additional_images)
  end
  
end

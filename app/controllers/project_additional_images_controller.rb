class ProjectAdditionalImagesController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_additional_images
  # GET /project_additional_images.xml  
  def index
    
    @project_additional_images = @project.project_additional_images.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_additional_images }
    end
  end

  # GET /project_additional_images/new
  # GET /project_additional_images/new.xml
  def new
    @project_additional_image = @project.project_additional_images.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_additional_image }
    end
  end

  # GET /project_additional_images/1/edit
  def edit
    @project_additional_image = @project.project_additional_images.find(params[:id])
  end

  # POST /project_additional_images
  # POST /project_additional_images.xml
  def create
    @project_additional_image = @project.project_additional_images.new(params[:project_additional_image])

    respond_to do |format|
      if @project_additional_image.save
        flash[:notice] = 'ProjectAdditionalImage was successfully created.'
        format.html { redirect_to project_project_additional_images_url(@project)}
        format.xml  { render :xml => @project_additional_image, :status => :created, :location => @project_additional_image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_additional_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_additional_images/1
  # PUT /project_additional_images/1.xml
  def update
    @project_additional_image = @project.project_additional_images.find(params[:id])

    respond_to do |format|
      if @project_additional_image.update_attributes(params[:project_additional_image])
        flash[:notice] = 'ProjectAdditionalImage was successfully updated.'
        format.html { redirect_to project_project_additional_images_url(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_additional_image.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_additional_images/1/higher
   def higher
     project_additional_image = @project.project_additional_images.find(params[:id])
     unless project_additional_image.nil?
       if project_additional_image.first?
         project_additional_image.move_to_bottom
       else
         project_additional_image.move_higher
       end
     end
     redirect_to project_project_additional_images_url(@project)
   end

   # PUT /project_additional_images/1/lower
   def lower
     project_additional_image = @project.project_additional_images.find(params[:id])
     unless project_additional_image.nil?
       if project_additional_image.last?
        project_additional_image.move_to_top
       else
        project_additional_image.move_lower
       end
     end
     redirect_to project_project_additional_images_url(@project)
   end

  # DELETE /project_additional_images/1
  # DELETE /project_additional_images/1.xml
  def destroy
    @project_additional_image = @project.project_additional_images.find(params[:id])
    @project_additional_image.destroy

    respond_to do |format|
      format.html { redirect_to project_project_additional_images_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_additional_images)
  end
  
end

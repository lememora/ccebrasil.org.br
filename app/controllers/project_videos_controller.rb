class ProjectVideosController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_videos
  # GET /project_videos.xml
  def index
    @project_videos = @project.project_videos.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_videos }
    end
  end

  # GET /project_videos/new
  # GET /project_videos/new.xml
  def new
    @project_video = @project.project_videos.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_video }
    end
  end

  # GET /project_videos/1/edit
  def edit
    @project_video = @project.project_videos.find(params[:id])
  end

  # POST /project_videos
  # POST /project_videos.xml
  def create
    @project_video = @project.project_videos.new(params[:project_video])

    respond_to do |format|
      if @project_video.save
        flash[:notice] = 'ProjectVideo was successfully created.'
        format.html { redirect_to project_project_videos_url(@project) }
        format.xml  { render :xml => @project_video, :status => :created, :location => @project_video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_videos/1
  # PUT /project_videos/1.xml
  def update
    @project_video = @project.project_videos.find(params[:id])

    respond_to do |format|
      if @project_video.update_attributes(params[:project_video])
        flash[:notice] = 'ProjectVideo was successfully updated.'
        format.html { redirect_to project_project_videos_url(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_video.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_videos/1/higher
   def higher
     project_video = @project.project_videos.find(params[:id])
     unless project_video.nil?
       if project_video.first?
         project_video.move_to_bottom
       else
         project_video.move_higher
       end
     end
     redirect_to project_project_videos_url(@project)
   end

   # PUT /project_videos/1/lower
   def lower
     project_video = @project.project_videos.find(params[:id])
     unless project_video.nil?
       if project_video.last?
        project_video.move_to_top
       else
        project_video.move_lower
       end
     end
     redirect_to project_project_videos_url(@project)
   end

  # DELETE /project_videos/1
  # DELETE /project_videos/1.xml
  def destroy
    @project_video = @project.project_videos.find(params[:id])
    @project_video.destroy

    respond_to do |format|
      format.html { redirect_to project_project_videos_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_videos)
  end
  
end

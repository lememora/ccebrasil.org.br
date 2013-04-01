class ProjectAudiosController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_audios
  # GET /project_audios.xml
  def index
    @project_audios = @project.project_audios.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_audios }
    end
  end

  # GET /project_audios/new
  # GET /project_audios/new.xml
  def new
    @project_audio = @project.project_audios.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_audio }
    end
  end

  # GET /project_audios/1/edit
  def edit
    @project_audio = @project.project_audios.find(params[:id])
  end

  # POST /project_audios
  # POST /project_audios.xml
  def create
    @project_audio = @project.project_audios.new(params[:project_audio])

    respond_to do |format|
      if @project_audio.save
        flash[:notice] = 'ProjectAudio was successfully created.'
        format.html { redirect_to project_project_audios_url(@project) }
        format.xml  { render :xml => @project_audio, :status => :created, :location => @project_audio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_audio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_audios/1
  # PUT /project_audios/1.xml
  def update
    @project_audio = @project.project_audios.find(params[:id])

    respond_to do |format|
      if @project_audio.update_attributes(params[:project_audio])
        flash[:notice] = 'ProjectAudio was successfully updated.'
        format.html { redirect_to project_project_audios_url(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_audio.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_audios/1/higher
   def higher
     project_audio = @project.project_audios.find(params[:id])
     unless project_audio.nil?
       if project_audio.first?
         project_audio.move_to_bottom
       else
         project_audio.move_higher
       end
     end
     redirect_to project_project_audios_url(@project)
   end

   # PUT /project_audios/1/lower
   def lower
     project_audio = @project.project_audios.find(params[:id])
     unless project_audio.nil?
       if project_audio.last?
        project_audio.move_to_top
       else
        project_audio.move_lower
       end
     end
     redirect_to project_project_audios_url(@project)
   end

  # DELETE /project_audios/1
  # DELETE /project_audios/1.xml
  def destroy
    @project_audio = @project.project_audios.find(params[:id])
    @project_audio.destroy

    respond_to do |format|
      format.html { redirect_to project_project_audios_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_audios)
  end
  
end

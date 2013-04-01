class ProjectLinksController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_links
  # GET /project_links.xml
  def index
    @project_links = @project.project_links.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_links }
    end
  end

  # GET /project_links/new
  # GET /project_links/new.xml
  def new
    @project_link =  @project.project_links.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_link }
    end
  end

  # GET /project_links/1/edit
  def edit
    @project_link =  @project.project_links.find(params[:id])
  end

  # POST /project_links
  # POST /project_links.xml
  def create
    @project_link =  @project.project_links.new(params[:project_link])

    respond_to do |format|
      if @project_link.save
        flash[:notice] = 'ProjectLink was successfully created.'
        format.html { redirect_to project_project_links_url(@project) }
        format.xml  { render :xml => @project_link, :status => :created, :location => @project_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_links/1
  # PUT /project_links/1.xml
  def update
    @project_link =  @project.project_links.find(params[:id])

    respond_to do |format|
      if @project_link.update_attributes(params[:project_link])
        flash[:notice] = 'ProjectLink was successfully updated.'
        format.html { redirect_to project_project_links_url(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_link.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_links/1/higher
   def higher
     project_link =  @project.project_links.find(params[:id])
     unless project_link.nil?
       if project_link.first?
         project_link.move_to_bottom
       else
         project_link.move_higher
       end
     end
     redirect_to project_project_links_url(@project)
   end

   # PUT /project_links/1/lower
   def lower
     project_link =  @project.project_links.find(params[:id])
     unless project_link.nil?
       if project_link.last?
        project_link.move_to_top
       else
        project_link.move_lower
       end
     end
     redirect_to project_project_links_url(@project)
   end

  # DELETE /project_links/1
  # DELETE /project_links/1.xml
  def destroy
    @project_link =  @project.project_links.find(params[:id])
    @project_link.destroy

    respond_to do |format|
      format.html { redirect_to project_project_links_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_links)
  end
  
end

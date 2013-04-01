class ProjectTextsController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_texts
  # GET /project_texts.xml
  def index
    @project_texts = @project.project_texts.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_texts }
    end
  end

  # GET /project_texts/new
  # GET /project_texts/new.xml
  def new
    @project_text = @project.project_texts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_text }
    end
  end

  # GET /project_texts/1/edit
  def edit
    @project_text = @project.project_texts.find(params[:id])
  end

  # POST /project_texts
  # POST /project_texts.xml
  def create
    @project_text = @project.project_texts.new(params[:project_text])

    respond_to do |format|
      if @project_text.save
        flash[:notice] = 'ProjectText was successfully created.'
        format.html { redirect_to project_project_texts_url(@project) }
        format.xml  { render :xml => @project_text, :status => :created, :location => @project_text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_texts/1
  # PUT /project_texts/1.xml
  def update
    @project_text = @project.project_texts.find(params[:id])

    respond_to do |format|
      if @project_text.update_attributes(params[:project_text])
        flash[:notice] = 'ProjectText was successfully updated.'
        format.html { redirect_to project_project_texts_url(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_text.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_texts/1/higher
   def higher
     project_text = @project.project_texts.find(params[:id])
     unless project_text.nil?
       if project_text.first?
         project_text.move_to_bottom
       else
         project_text.move_higher
       end
     end
     redirect_to project_project_texts_url(@project)
   end

   # PUT /pproject_texts/1/lower
   def lower
     project_text = @project.project_texts.find(params[:id])
     unless project_text.nil?
       if project_text.last?
        project_text.move_to_top
       else
        project_text.move_lower
       end
     end
     redirect_to project_project_texts_url(@project)
   end

  # DELETE /project_texts/1
  # DELETE /project_texts/1.xml
  def destroy
    @project_text = @project.project_texts.find(params[:id])
    @project_text.destroy

    respond_to do |format|
      format.html { redirect_to project_project_texts_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_texts)
  end
  
end

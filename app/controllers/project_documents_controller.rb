class ProjectDocumentsController < ApplicationController
  
  before_filter :load_project
  
  # GET /project_documents
  # GET /project_documents.xml
  def index
    @project_documents = @project.project_documents.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_documents }
    end
  end

  # GET /project_documents/new
  # GET /project_documents/new.xml
  def new
    @project_document = @project.project_documents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_document }
    end
  end

  # GET /project_documents/1/edit
  def edit
    @project_document = @project.project_documents.find(params[:id])
  end

  # POST /project_documents
  # POST /project_documents.xml
  def create
    @project_document = @project.project_documents.new(params[:project_document])

    respond_to do |format|
      if @project_document.save
        flash[:notice] = 'ProjectDocument was successfully created.'
        format.html { redirect_to project_project_documents_url(@project)  }
        format.xml  { render :xml => @project_document, :status => :created, :location => @project_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_documents/1
  # PUT /project_documents/1.xml
  def update
    @project_document = @project.project_documents.find(params[:id])

    respond_to do |format|
      if @project_document.update_attributes(params[:project_document])
        flash[:notice] = 'ProjectDocument was successfully updated.'
        format.html { redirect_to project_project_documents_url(@project)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /project_documents/1/higher
   def higher
     project_document = @project.project_documents.find(params[:id])
     unless project_document.nil?
       if project_document.first?
         project_document.move_to_bottom
       else
         project_document.move_higher
       end
     end
     redirect_to project_project_documents_url(@project)
   end

   # PUT /project_documents/1/lower
   def lower
     project_document = @project.project_documents.find(params[:id])
     unless project_document.nil?
       if project_document.last?
        project_document.move_to_top
       else
        project_document.move_lower
       end
     end
     redirect_to project_project_documents_url(@project)
   end

  # DELETE /project_documents/1
  # DELETE /project_documents/1.xml
  def destroy
    @project_document = @project.project_documents.find(params[:id])
    @project_document.destroy

    respond_to do |format|
      format.html { redirect_to project_project_documents_url(@project) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_project
    @project = Project.find(params[:project_id], :include => :project_documents)
  end
  
end

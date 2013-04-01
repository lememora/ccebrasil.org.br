class LivingFileDocumentsController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_documents
  # GET /living_file_documents.xml
  def index
    @living_file_documents = @living_file.living_file_documents.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_documents }
    end
  end

  # GET /living_file_documents/new
  # GET /living_file_documents/new.xml
  def new
    @living_file_document = @living_file.living_file_documents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_document }
    end
  end

  # GET /living_file_documents/1/edit
  def edit
    @living_file_document = @living_file.living_file_documents.find(params[:id])
  end

  # POST /living_file_documents
  # POST /living_file_documents.xml
  def create
    @living_file_document = @living_file.living_file_documents.new(params[:living_file_document])

    respond_to do |format|
      if @living_file_document.save
        flash[:notice] = 'LivingFileDocument was successfully created.'
        format.html { redirect_to living_file_living_file_documents_url(@living_file) }
        format.xml  { render :xml => @living_file_document, :status => :created, :location => @living_file_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_documents/1
  # PUT /living_file_documents/1.xml
  def update
    @living_file_document = @living_file.living_file_documents.find(params[:id])

    respond_to do |format|
      if @living_file_document.update_attributes(params[:living_file_document])
        flash[:notice] = 'LivingFileDocument was successfully updated.'
        format.html { redirect_to living_file_living_file_documents_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_documents/1/higher
   def higher
     living_file_document = @living_file.living_file_documents.find(params[:id])
     unless living_file_document.nil?
       if living_file_document.first?
         living_file_document.move_to_bottom
       else
         living_file_document.move_higher
       end
     end
     redirect_to living_file_living_file_documents_url(@living_file)
   end

   # PUT /living_file_documents/1/lower
   def lower
     living_file_document = @living_file.living_file_documents.find(params[:id])
     unless living_file_document.nil?
       if living_file_document.last?
        living_file_document.move_to_top
       else
        living_file_document.move_lower
       end
     end
     redirect_to living_file_living_file_documents_url(@living_file)
   end

  # DELETE /living_file_documents/1
  # DELETE /living_file_documents/1.xml
  def destroy
    @living_file_document = @living_file.living_file_documents.find(params[:id])
    @living_file_document.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_documents_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_documents)
  end
  
end

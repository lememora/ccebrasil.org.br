class LivingFilesController < ApplicationController
  
  before_filter :authenticate
  before_filter :load_living_file_categories
  
  # GET /living_files
  # GET /living_files.xml
  def index
    @living_files = LivingFile.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_files }
    end
  end

  # GET /living_files/1
  # GET /living_files/1.xml
  def show
    @living_file = LivingFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @living_file }
    end
  end

  # GET /living_files/new
  # GET /living_files/new.xml
  def new
    @living_file = LivingFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file }
    end
  end

  # GET /living_files/1/edit
  def edit
    @living_file = LivingFile.find(params[:id])
  end

  # POST /living_files
  # POST /living_files.xml
  def create
    @living_file = LivingFile.new(params[:living_file])

    respond_to do |format|
      if @living_file.save
        flash[:notice] = 'LivingFile was successfully created.'
        format.html { redirect_to(@living_file) }
        format.xml  { render :xml => @living_file, :status => :created, :location => @living_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_files/1
  # PUT /living_files/1.xml
  def update
    @living_file = LivingFile.find(params[:id])

    respond_to do |format|
      if @living_file.update_attributes(params[:living_file])
        flash[:notice] = 'LivingFile was successfully updated.'
        format.html { redirect_to(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_files/1/higher
   def higher
     living_file = LivingFile.find(params[:id])
     unless living_file.nil?
       if living_file.first?
         living_file.move_to_bottom
       else
         living_file.move_higher
       end
     end
     redirect_to living_files_url
   end

   # PUT /living_files/1/lower
   def lower
     living_file = LivingFile.find(params[:id])
     unless living_file.nil?
       if living_file.last?
        living_file.move_to_top
       else
        living_file.move_lower
       end
     end
     redirect_to living_files_url 
   end

  # DELETE /living_files/1
  # DELETE /living_files/1.xml
  def destroy
    @living_file = LivingFile.find(params[:id])
    @living_file.destroy

    respond_to do |format|
      format.html { redirect_to(living_files_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file_categories
    @living_file_categories = LivingFileCategory.find(:all, :order => :category).collect { |c| [ c.category, c.id ] }
  end
  
end

class LivingFileCategoriesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /living_file_categories
  # GET /living_file_categories.xml
  def index
    @living_file_categories = LivingFileCategory.find(:all, :order => :category)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_categories }
    end
  end

  # GET /living_file_categories/1
  # GET /living_file_categories/1.xml
  def show
    @living_file_category = LivingFileCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @living_file_category }
    end
  end

  # GET /living_file_categories/new
  # GET /living_file_categories/new.xml
  def new
    @living_file_category = LivingFileCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_category }
    end
  end

  # GET /living_file_categories/1/edit
  def edit
    @living_file_category = LivingFileCategory.find(params[:id])
  end

  # POST /living_file_categories
  # POST /living_file_categories.xml
  def create
    @living_file_category = LivingFileCategory.new(params[:living_file_category])

    respond_to do |format|
      if @living_file_category.save
        flash[:notice] = 'LivingFileCategory was successfully created.'
        format.html { redirect_to(@living_file_category) }
        format.xml  { render :xml => @living_file_category, :status => :created, :location => @living_file_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_categories/1
  # PUT /living_file_categories/1.xml
  def update
    @living_file_category = LivingFileCategory.find(params[:id])

    respond_to do |format|
      if @living_file_category.update_attributes(params[:living_file_category])
        flash[:notice] = 'LivingFileCategory was successfully updated.'
        format.html { redirect_to(@living_file_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /living_file_categories/1
  # DELETE /living_file_categories/1.xml
  def destroy
    @living_file_category = LivingFileCategory.find(params[:id])
    @living_file_category.destroy

    respond_to do |format|
      format.html { redirect_to(living_file_categories_url) }
      format.xml  { head :ok }
    end
  end
end

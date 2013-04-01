class LivingFileLinksController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_links
  # GET /living_file_links.xml
  def index
    @living_file_links = @living_file.living_file_links.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_links }
    end
  end

  # GET /living_file_links/new
  # GET /living_file_links/new.xml
  def new
    @living_file_link = @living_file.living_file_links.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_link }
    end
  end

  # GET /living_file_links/1/edit
  def edit
    @living_file_link = @living_file.living_file_links.find(params[:id])
  end

  # POST /living_file_links
  # POST /living_file_links.xml
  def create
    @living_file_link = @living_file.living_file_links.new(params[:living_file_link])

    respond_to do |format|
      if @living_file_link.save
        flash[:notice] = 'LivingFileLink was successfully created.'
        format.html { redirect_to living_file_living_file_links_url(@living_file) }
        format.xml  { render :xml => @living_file_link, :status => :created, :location => @living_file_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_links/1
  # PUT /living_file_links/1.xml
  def update
    @living_file_link = @living_file.living_file_links.find(params[:id])

    respond_to do |format|
      if @living_file_link.update_attributes(params[:living_file_link])
        flash[:notice] = 'LivingFileLink was successfully updated.'
        format.html { redirect_to living_file_living_file_links_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_link.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_links/1/higher
   def higher
     living_file_link = @living_file.living_file_links.find(params[:id])
     unless living_file_link.nil?
       if living_file_link.first?
         living_file_link.move_to_bottom
       else
         living_file_link.move_higher
       end
     end
     redirect_to living_file_living_file_links_url(@living_file)
   end

   # PUT /living_file_links/1/lower
   def lower
     living_file_link = @living_file.living_file_links.find(params[:id])
     unless living_file_link.nil?
       if living_file_link.last?
        living_file_link.move_to_top
       else
        living_file_link.move_lower
       end
     end
     redirect_to living_file_living_file_links_url(@living_file)
   end

  # DELETE /living_file_links/1
  # DELETE /living_file_links/1.xml
  def destroy
    @living_file_link = @living_file.living_file_links.find(params[:id])
    @living_file_link.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_links_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_links)
  end
  
end

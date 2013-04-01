class AecidSitesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /aecid_sites
  # GET /aecid_sites.xml
  def index
    @aecid_sites = AecidSite.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aecid_sites }
    end
  end

  # GET /aecid_sites/1
  # GET /aecid_sites/1.xml
  def show
    @aecid_site = AecidSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aecid_site }
    end
  end

  # GET /aecid_sites/new
  # GET /aecid_sites/new.xml
  def new
    @aecid_site = AecidSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aecid_site }
    end
  end

  # GET /aecid_sites/1/edit
  def edit
    @aecid_site = AecidSite.find(params[:id])
  end

  # POST /aecid_sites
  # POST /aecid_sites.xml
  def create
    @aecid_site = AecidSite.new(params[:aecid_site])

    respond_to do |format|
      if @aecid_site.save
        flash[:notice] = 'AecidSite was successfully created.'
        format.html { redirect_to(@aecid_site) }
        format.xml  { render :xml => @aecid_site, :status => :created, :location => @aecid_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aecid_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aecid_sites/1
  # PUT /aecid_sites/1.xml
  def update
    @aecid_site = AecidSite.find(params[:id])

    respond_to do |format|
      if @aecid_site.update_attributes(params[:aecid_site])
        flash[:notice] = 'AecidSite was successfully updated.'
        format.html { redirect_to(@aecid_site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aecid_site.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /aecid_sites/1/higher
   def higher
     aecid_site = AecidSite.find(params[:id])
     unless aecid_site.nil?
       if aecid_site.first?
         aecid_site.move_to_bottom
       else
         aecid_site.move_higher
       end
     end
     redirect_to aecid_sites_url
   end

   # PUT /aecid_sites/1/lower
   def lower
     aecid_site = AecidSite.find(params[:id])
     unless aecid_site.nil?
       if aecid_site.last?
        aecid_site.move_to_top
       else
        aecid_site.move_lower
       end
     end
     redirect_to aecid_sites_url 
   end

  # DELETE /aecid_sites/1
  # DELETE /aecid_sites/1.xml
  def destroy
    @aecid_site = AecidSite.find(params[:id])
    @aecid_site.destroy

    respond_to do |format|
      format.html { redirect_to(aecid_sites_url) }
      format.xml  { head :ok }
    end
  end
end

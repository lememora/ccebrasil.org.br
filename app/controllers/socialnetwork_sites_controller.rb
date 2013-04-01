class SocialnetworkSitesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /socialnetwork_sites
  # GET /socialnetwork_sites.xml
  def index
    @socialnetwork_sites = SocialnetworkSite.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @socialnetwork_sites }
    end
  end

  # GET /socialnetwork_sites/1
  # GET /socialnetwork_sites/1.xml
  def show
    @socialnetwork_site = SocialnetworkSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @socialnetwork_site }
    end
  end

  # GET /socialnetwork_sites/new
  # GET /socialnetwork_sites/new.xml
  def new
    @socialnetwork_site = SocialnetworkSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @socialnetwork_site }
    end
  end

  # GET /socialnetwork_sites/1/edit
  def edit
    @socialnetwork_site = SocialnetworkSite.find(params[:id])
  end

  # POST /socialnetwork_sites
  # POST /socialnetwork_sites.xml
  def create
    @socialnetwork_site = SocialnetworkSite.new(params[:socialnetwork_site])

    respond_to do |format|
      if @socialnetwork_site.save
        flash[:notice] = 'SocialnetworkSite was successfully created.'
        format.html { redirect_to(@socialnetwork_site) }
        format.xml  { render :xml => @socialnetwork_site, :status => :created, :location => @socialnetwork_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @socialnetwork_site.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /socialnetwork_sites/1
  # PUT /socialnetwork_sites/1.xml
  def update
    @socialnetwork_site = SocialnetworkSite.find(params[:id])

    respond_to do |format|
      if @socialnetwork_site.update_attributes(params[:socialnetwork_site])
        flash[:notice] = 'SocialnetworkSite was successfully updated.'
        format.html { redirect_to(@socialnetwork_site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @socialnetwork_site.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /socialnetwork_sites/1/higher
   def higher
     socialnetwork_site = SocialnetworkSite.find(params[:id])
     unless socialnetwork_site.nil?
       if socialnetwork_site.first?
         socialnetwork_site.move_to_bottom
       else
         socialnetwork_site.move_higher
       end
     end
     redirect_to socialnetwork_sites_url
   end

   # PUT /socialnetwork_sites/1/lower
   def lower
     socialnetwork_site = SocialnetworkSite.find(params[:id])
     unless socialnetwork_site.nil?
       if socialnetwork_site.last?
        socialnetwork_site.move_to_top
       else
        socialnetwork_site.move_lower
       end
     end
     redirect_to socialnetwork_sites_url 
   end

  # DELETE /socialnetwork_sites/1
  # DELETE /socialnetwork_sites/1.xml
  def destroy
    @socialnetwork_site = SocialnetworkSite.find(params[:id])
    @socialnetwork_site.destroy

    respond_to do |format|
      format.html { redirect_to(socialnetwork_sites_url) }
      format.xml  { head :ok }
    end
  end
end

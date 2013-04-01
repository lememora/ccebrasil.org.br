class PartnerSitesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /partner_sites
  # GET /partner_sites.xml
  def index
    @partner_sites = PartnerSite.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partner_sites }
    end
  end

  # GET /partner_sites/1
  # GET /partner_sites/1.xml
  def show
    @partner_site = PartnerSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partner_site }
    end
  end

  # GET /partner_sites/new
  # GET /partner_sites/new.xml
  def new
    @partner_site = PartnerSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partner_site }
    end
  end

  # GET /partner_sites/1/edit
  def edit
    @partner_site = PartnerSite.find(params[:id])
  end

  # POST /partner_sites
  # POST /partner_sites.xml
  def create
    @partner_site = PartnerSite.new(params[:partner_site])

    respond_to do |format|
      if @partner_site.save
        flash[:notice] = 'PartnerSite was successfully created.'
        format.html { redirect_to(@partner_site) }
        format.xml  { render :xml => @partner_site, :status => :created, :location => @partner_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partner_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partner_sites/1
  # PUT /partner_sites/1.xml
  def update
    @partner_site = PartnerSite.find(params[:id])

    respond_to do |format|
      if @partner_site.update_attributes(params[:partner_site])
        flash[:notice] = 'PartnerSite was successfully updated.'
        format.html { redirect_to(@partner_site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partner_site.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /partner_sites/1/higher
   def higher
     partner_site = PartnerSite.find(params[:id])
     unless partner_site.nil?
       if partner_site.first?
         partner_site.move_to_bottom
       else
         partner_site.move_higher
       end
     end
     redirect_to partner_sites_url
   end

   # PUT /partner_sites/1/lower
   def lower
     partner_site = PartnerSite.find(params[:id])
     unless partner_site.nil?
       if partner_site.last?
        partner_site.move_to_top
       else
        partner_site.move_lower
       end
     end
     redirect_to partner_sites_url 
   end

  # DELETE /partner_sites/1
  # DELETE /partner_sites/1.xml
  def destroy
    @partner_site = PartnerSite.find(params[:id])
    @partner_site.destroy

    respond_to do |format|
      format.html { redirect_to(partner_sites_url) }
      format.xml  { head :ok }
    end
  end
end

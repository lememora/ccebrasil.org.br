class JournalistsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /journalists
  # GET /journalists.xml
  def index
    @journalists = Journalist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @journalists }
    end
  end

  # GET /journalists/1
  # GET /journalists/1.xml
  def show
    @journalist = Journalist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @journalist }
    end
  end

  # GET /journalists/new
  # GET /journalists/new.xml
  def new
    @journalist = Journalist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @journalist }
    end
  end

  # GET /journalists/1/edit
  def edit
    @journalist = Journalist.find(params[:id])
  end

  # POST /journalists
  # POST /journalists.xml
  def create
    @journalist = Journalist.new(params[:journalist])

    respond_to do |format|
      if @journalist.save
        flash[:notice] = 'Journalist was successfully created.'
        format.html { redirect_to(@journalist) }
        format.xml  { render :xml => @journalist, :status => :created, :location => @journalist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @journalist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /journalists/1
  # PUT /journalists/1.xml
  def update
    @journalist = Journalist.find(params[:id])

    respond_to do |format|
      if @journalist.update_attributes(params[:journalist])
        flash[:notice] = 'Journalist was successfully updated.'
        format.html { redirect_to(@journalist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @journalist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /journalists/1
  # DELETE /journalists/1.xml
  def destroy
    @journalist = Journalist.find(params[:id])
    @journalist.destroy

    respond_to do |format|
      format.html { redirect_to(journalists_url) }
      format.xml  { head :ok }
    end
  end
end

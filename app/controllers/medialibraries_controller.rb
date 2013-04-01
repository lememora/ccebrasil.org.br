class MedialibrariesController < ApplicationController
  
  before_filter :authenticate
  
  # GET /medialibraries
  # GET /medialibraries.xml
  def index
    @medialibraries = Medialibrary.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medialibraries }
    end
  end

  # GET /medialibraries/1
  # GET /medialibraries/1.xml
  def show
    @medialibrary = Medialibrary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medialibrary }
    end
  end

  # GET /medialibraries/new
  # GET /medialibraries/new.xml
  def new
    @medialibrary = Medialibrary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medialibrary }
    end
  end

  # GET /medialibraries/1/edit
  def edit
    @medialibrary = Medialibrary.find(params[:id])
  end

  # POST /medialibraries
  # POST /medialibraries.xml
  def create
    @medialibrary = Medialibrary.new(params[:medialibrary])

    respond_to do |format|
      if @medialibrary.save
        flash[:notice] = 'Medialibrary was successfully created.'
        format.html { redirect_to(@medialibrary) }
        format.xml  { render :xml => @medialibrary, :status => :created, :location => @medialibrary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medialibrary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medialibraries/1
  # PUT /medialibraries/1.xml
  def update
    @medialibrary = Medialibrary.find(params[:id])

    respond_to do |format|
      if @medialibrary.update_attributes(params[:medialibrary])
        flash[:notice] = 'Medialibrary was successfully updated.'
        format.html { redirect_to(@medialibrary) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medialibrary.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /medialibraries/1/higher
   def higher
     medialibrary = Medialibrary.find(params[:id])
     unless medialibrary.nil?
       if medialibrary.first?
         medialibrary.move_to_bottom
       else
         medialibrary.move_higher
       end
     end
     redirect_to medialibraries_url
   end

   # PUT /medialibraries/1/lower
   def lower
     medialibrary = Medialibrary.find(params[:id])
     unless medialibrary.nil?
       if medialibrary.last?
        medialibrary.move_to_top
       else
        medialibrary.move_lower
       end
     end
     redirect_to medialibraries_url 
   end

  # DELETE /medialibraries/1
  # DELETE /medialibraries/1.xml
  def destroy
    @medialibrary = Medialibrary.find(params[:id])
    @medialibrary.destroy

    respond_to do |format|
      format.html { redirect_to(medialibraries_url) }
      format.xml  { head :ok }
    end
  end
end

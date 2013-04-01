class PressKitsController < ApplicationController
  
  before_filter :authenticate
  
  # GET /press_kits
  # GET /press_kits.xml
  def index
    @press_kits = PressKit.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @press_kits }
    end
  end

  # GET /press_kits/new
  # GET /press_kits/new.xml
  def new
    @press_kit = PressKit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @press_kit }
    end
  end

  # GET /press_kits/1/edit
  def edit
    @press_kit = PressKit.find(params[:id])
  end

  # POST /press_kits
  # POST /press_kits.xml
  def create
    @press_kit = PressKit.new(params[:press_kit])

    respond_to do |format|
      if @press_kit.save
        flash[:notice] = 'PressKit was successfully created.'
        format.html { redirect_to press_kits_url }
        format.xml  { render :xml => @press_kit, :status => :created, :location => @press_kit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @press_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /press_kits/1
  # PUT /press_kits/1.xml
  def update
    @press_kit = PressKit.find(params[:id])

    respond_to do |format|
      if @press_kit.update_attributes(params[:press_kit])
        flash[:notice] = 'PressKit was successfully updated.'
        format.html { redirect_to press_kits_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @press_kit.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /press_kits/1/higher
   def higher
     press_kit = PressKit.find(params[:id])
     unless press_kit.nil?
       if press_kit.first?
         press_kit.move_to_bottom
       else
         press_kit.move_higher
       end
     end
     redirect_to press_kits_url
   end

   # PUT /press_kits/1/lower
   def lower
     press_kit = PressKit.find(params[:id])
     unless press_kit.nil?
       if press_kit.last?
        press_kit.move_to_top
       else
        press_kit.move_lower
       end
     end
     redirect_to press_kits_url 
   end

  # DELETE /press_kits/1
  # DELETE /press_kits/1.xml
  def destroy
    @press_kit = PressKit.find(params[:id])
    @press_kit.destroy

    respond_to do |format|
      format.html { redirect_to press_kits_url }
      format.xml  { head :ok }
    end
  end
end

class LivingFileTextsController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_texts
  # GET /living_file_texts.xml
  def index
    @living_file_texts = @living_file.living_file_texts.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_texts }
    end
  end

  # GET /living_file_texts/new
  # GET /living_file_texts/new.xml
  def new
    @living_file_text = @living_file.living_file_texts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_text }
    end
  end

  # GET /living_file_texts/1/edit
  def edit
    @living_file_text = @living_file.living_file_texts.find(params[:id])
  end

  # POST /living_file_texts
  # POST /living_file_texts.xml
  def create
    @living_file_text = @living_file.living_file_texts.new(params[:living_file_text])

    respond_to do |format|
      if @living_file_text.save
        flash[:notice] = 'LivingFileText was successfully created.'
        format.html { redirect_to living_file_living_file_texts_url(@living_file) }
        format.xml  { render :xml => @living_file_text, :status => :created, :location => @living_file_text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_texts/1
  # PUT /living_file_texts/1.xml
  def update
    @living_file_text = @living_file.living_file_texts.find(params[:id])

    respond_to do |format|
      if @living_file_text.update_attributes(params[:living_file_text])
        flash[:notice] = 'LivingFileText was successfully updated.'
        format.html { redirect_to living_file_living_file_texts_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_text.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_texts/1/higher
   def higher
     living_file_text = @living_file.living_file_texts.find(params[:id])
     unless living_file_text.nil?
       if living_file_text.first?
         living_file_text.move_to_bottom
       else
         living_file_text.move_higher
       end
     end
     redirect_to living_file_living_file_texts_url(@living_file)
   end

   # PUT /living_file_texts/1/lower
   def lower
     living_file_text = @living_file.living_file_texts.find(params[:id])
     unless living_file_text.nil?
       if living_file_text.last?
        living_file_text.move_to_top
       else
        living_file_text.move_lower
       end
     end
     redirect_to living_file_living_file_texts_url(@living_file)
   end

  # DELETE /living_file_texts/1
  # DELETE /living_file_texts/1.xml
  def destroy
    @living_file_text = @living_file.living_file_texts.find(params[:id])
    @living_file_text.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_texts_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_texts)
  end
  
end

class LivingFileAudiosController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_audios
  # GET /living_file_audios.xml
  def index
    @living_file_audios = @living_file.living_file_audios.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_audios }
    end
  end

  # GET /living_file_audios/new
  # GET /living_file_audios/new.xml
  def new
    @living_file_audio = @living_file.living_file_audios.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_audio }
    end
  end

  # GET /living_file_audios/1/edit
  def edit
    @living_file_audio = @living_file.living_file_audios.find(params[:id])
  end

  # POST /living_file_audios
  # POST /living_file_audios.xml
  def create
    @living_file_audio = @living_file.living_file_audios.new(params[:living_file_audio])

    respond_to do |format|
      if @living_file_audio.save
        flash[:notice] = 'LivingFileAudio was successfully created.'
        format.html { redirect_to living_file_living_file_audios_url(@living_file) }
        format.xml  { render :xml => @living_file_audio, :status => :created, :location => @living_file_audio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_audio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_audios/1
  # PUT /living_file_audios/1.xml
  def update
    @living_file_audio = @living_file.living_file_audios.find(params[:id])

    respond_to do |format|
      if @living_file_audio.update_attributes(params[:living_file_audio])
        flash[:notice] = 'LivingFileAudio was successfully updated.'
        format.html { redirect_to living_file_living_file_audios_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_audio.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_audios/1/higher
   def higher
     living_file_audio = @living_file.living_file_audios.find(params[:id])
     unless living_file_audio.nil?
       if living_file_audio.first?
         living_file_audio.move_to_bottom
       else
         living_file_audio.move_higher
       end
     end
     redirect_to living_file_living_file_audios_url(@living_file)
   end

   # PUT /living_file_audios/1/lower
   def lower
     living_file_audio = @living_file.living_file_audios.find(params[:id])
     unless living_file_audio.nil?
       if living_file_audio.last?
        living_file_audio.move_to_top
       else
        living_file_audio.move_lower
       end
     end
     redirect_to living_file_living_file_audios_url(@living_file)
   end

  # DELETE /living_file_audios/1
  # DELETE /living_file_audios/1.xml
  def destroy
    @living_file_audio = @living_file.living_file_audios.find(params[:id])
    @living_file_audio.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_audios_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_audios)
  end
  
end

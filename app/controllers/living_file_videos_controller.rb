class LivingFileVideosController < ApplicationController
  
  before_filter :load_living_file
  
  # GET /living_file_videos
  # GET /living_file_videos.xml
  def index
    @living_file_videos = @living_file.living_file_videos.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @living_file_videos }
    end
  end


  # GET /living_file_videos/new
  # GET /living_file_videos/new.xml
  def new
    @living_file_video = @living_file.living_file_videos.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @living_file_video }
    end
  end

  # GET /living_file_videos/1/edit
  def edit
    @living_file_video = @living_file.living_file_videos.find(params[:id])
  end

  # POST /living_file_videos
  # POST /living_file_videos.xml
  def create
    @living_file_video = @living_file.living_file_videos.new(params[:living_file_video])

    respond_to do |format|
      if @living_file_video.save
        flash[:notice] = 'LivingFileVideo was successfully created.'
        format.html { redirect_to living_file_living_file_videos_url(@living_file) }
        format.xml  { render :xml => @living_file_video, :status => :created, :location => @living_file_video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @living_file_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /living_file_videos/1
  # PUT /living_file_videos/1.xml
  def update
    @living_file_video = @living_file.living_file_videos.find(params[:id])

    respond_to do |format|
      if @living_file_video.update_attributes(params[:living_file_video])
        flash[:notice] = 'LivingFileVideo was successfully updated.'
        format.html { redirect_to living_file_living_file_videos_url(@living_file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @living_file_video.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /living_file_videos/1/higher
   def higher
     living_file_video = @living_file.living_file_videos.find(params[:id])
     unless living_file_video.nil?
       if living_file_video.first?
         living_file_video.move_to_bottom
       else
         living_file_video.move_higher
       end
     end
     redirect_to living_file_living_file_videos_url(@living_file)
   end

   # PUT /living_file_videos/1/lower
   def lower
     living_file_video = @living_file.living_file_videos.find(params[:id])
     unless living_file_video.nil?
       if living_file_video.last?
        living_file_video.move_to_top
       else
        living_file_video.move_lower
       end
     end
     redirect_to living_file_living_file_videos_url(@living_file)
   end

  # DELETE /living_file_videos/1
  # DELETE /living_file_videos/1.xml
  def destroy
    @living_file_video = @living_file.living_file_videos.find(params[:id])
    @living_file_video.destroy

    respond_to do |format|
      format.html { redirect_to living_file_living_file_videos_url(@living_file) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_living_file
    @living_file = LivingFile.find(params[:living_file_id], :include => :living_file_videos)
  end
  
end

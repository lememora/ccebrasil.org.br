class MedialibraryUsersController < ApplicationController
  
  before_filter :authenticate
  
  # GET /medialibrary_users
  # GET /medialibrary_users.xml
  def index
    @medialibrary_users = MedialibraryUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medialibrary_users }
    end
  end
  
  def excel
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="usuarios_midiateca.xls"'
    headers['Cache-Control'] = ''
    @medialibrary_users = MedialibraryUser.all
    render :xls => @medialibrary_users, :layout => false
  end

  # GET /medialibrary_users/1
  # GET /medialibrary_users/1.xml
  def show
    @medialibrary_user = MedialibraryUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medialibrary_user }
    end
  end

  # GET /medialibrary_users/new
  # GET /medialibrary_users/new.xml
  def new
    @medialibrary_user = MedialibraryUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medialibrary_user }
    end
  end

  # GET /medialibrary_users/1/edit
  def edit
    @medialibrary_user = MedialibraryUser.find(params[:id])
  end

  # POST /medialibrary_users
  # POST /medialibrary_users.xml
  def create
    @medialibrary_user = MedialibraryUser.new(params[:medialibrary_user])

    respond_to do |format|
      if @medialibrary_user.save
        flash[:notice] = 'MedialibraryUser was successfully created.'
        format.html { redirect_to(@medialibrary_user) }
        format.xml  { render :xml => @medialibrary_user, :status => :created, :location => @medialibrary_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medialibrary_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medialibrary_users/1
  # PUT /medialibrary_users/1.xml
  def update
    @medialibrary_user = MedialibraryUser.find(params[:id])

    respond_to do |format|
      if @medialibrary_user.update_attributes(params[:medialibrary_user])
        flash[:notice] = 'MedialibraryUser was successfully updated.'
        format.html { redirect_to(@medialibrary_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medialibrary_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medialibrary_users/1
  # DELETE /medialibrary_users/1.xml
  def destroy
    @medialibrary_user = MedialibraryUser.find(params[:id])
    @medialibrary_user.destroy

    respond_to do |format|
      format.html { redirect_to(medialibrary_users_url) }
      format.xml  { head :ok }
    end
  end
  
end

class ProgramUsersController < ApplicationController
  
  before_filter :authenticate
  
  # GET /program_users
  # GET /program_users.xml
  def index
    @program_users = ProgramUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @program_users }
    end
  end
  
  def excel
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="usuarios_programacao.xls"'
    headers['Cache-Control'] = ''
    @program_users = ProgramUser.all
    render :xls => @program_users, :layout => false
  end

  # GET /program_users/1
  # GET /program_users/1.xml
  def show
    @program_user = ProgramUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @program_user }
    end
  end

  # GET /program_users/new
  # GET /program_users/new.xml
  def new
    @program_user = ProgramUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program_user }
    end
  end

  # GET /program_users/1/edit
  def edit
    @program_user = ProgramUser.find(params[:id])
  end

  # POST /program_users
  # POST /program_users.xml
  def create
    @program_user = ProgramUser.new(params[:program_user])

    respond_to do |format|
      if @program_user.save
        flash[:notice] = 'ProgramUser was successfully created.'
        format.html { redirect_to(@program_user) }
        format.xml  { render :xml => @program_user, :status => :created, :location => @program_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @program_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /program_users/1
  # PUT /program_users/1.xml
  def update
    @program_user = ProgramUser.find(params[:id])

    respond_to do |format|
      if @program_user.update_attributes(params[:program_user])
        flash[:notice] = 'ProgramUser was successfully updated.'
        format.html { redirect_to(@program_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @program_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /program_users/1
  # DELETE /program_users/1.xml
  def destroy
    @program_user = ProgramUser.find(params[:id])
    @program_user.destroy

    respond_to do |format|
      format.html { redirect_to(program_users_url) }
      format.xml  { head :ok }
    end
  end
end

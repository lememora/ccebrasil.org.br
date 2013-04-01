class ProgramsController < ApplicationController
  
  before_filter :authenticate
  before_filter :load_program_categories
  
  # GET /programs
  # GET /programs.xml
  def index
    @programs = Program.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /programs/1
  # GET /programs/1.xml
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.xml
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # POST /programs
  # POST /programs.xml
  def create
    @program = Program.new(params[:program])

    respond_to do |format|
      if @program.save
        flash[:notice] = 'Program was successfully created.'
        format.html { redirect_to(@program) }
        format.xml  { render :xml => @program, :status => :created, :location => @program }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.xml
  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        flash[:notice] = 'Program was successfully updated.'
        format.html { redirect_to(@program) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /programs/1/higher
   def higher
     program = Program.find(params[:id])
     unless program.nil?
       if program.first?
         program.move_to_bottom
       else
         program.move_higher
       end
     end
     redirect_to programs_url
   end

   # PUT /programs/1/lower
   def lower
     program = Program.find(params[:id])
     unless program.nil?
       if program.last?
        program.move_to_top
       else
        program.move_lower
       end
     end
     redirect_to programs_url 
   end
  
  # DELETE /programs/1
  # DELETE /programs/1.xml
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to(programs_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_program_categories
    @program_categories = ProgramCategory.find(:all, :order => :category).collect { |c| [c.category, c.id] }
  end
  
end

class PressDocumentsController < ApplicationController
  
  before_filter :load_press_kit
  
  # GET /press_documents
  # GET /press_documents.xml
  def index
    @press_documents = @press_kit.press_documents.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @press_documents }
    end
  end


  # GET /press_documents/new
  # GET /press_documents/new.xml
  def new
    @press_document = @press_kit.press_documents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @press_document }
    end
  end

  # GET /press_documents/1/edit
  def edit
    @press_document = @press_kit.press_documents.find(params[:id])
  end

  # POST /press_documents
  # POST /press_documents.xml
  def create
    @press_document = @press_kit.press_documents.new(params[:press_document])

    respond_to do |format|
      if @press_document.save
        flash[:notice] = 'PressDocument was successfully created.'
        format.html { redirect_to press_kit_press_documents_url(@press_kit)  }
        format.xml  { render :xml => @press_document, :status => :created, :location => @press_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @press_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /press_documents/1
  # PUT /press_documents/1.xml
  def update
    @press_document = @press_kit.press_documents.find(params[:id])

    respond_to do |format|
      if @press_document.update_attributes(params[:press_document])
        flash[:notice] = 'PressDocument was successfully updated.'
        format.html { redirect_to press_kit_press_documents_url(@press_kit)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @press_document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /press_documents1/higher
   def higher
     press_document = @press_kit.press_documents.find(params[:id])
     unless press_document.nil?
       if press_document.first?
         press_document.move_to_bottom
       else
         press_document.move_higher
       end
     end
     redirect_to press_kit_press_documents_url(@press_kit)
   end

   # PUT /press_documents/1/lower
   def lower
     press_document = @press_kit.press_documents.find(params[:id])
     unless press_document.nil?
       if press_document.last?
        press_document.move_to_top
       else
        press_document.move_lower
       end
     end
     redirect_to press_kit_press_documents_url(@press_kit)
   end

  # DELETE /press_documents/1
  # DELETE /press_documents/1.xml
  def destroy
    @press_document = @press_kit.press_documents.find(params[:id])
    @press_document.destroy

    respond_to do |format|
      format.html { redirect_to press_kit_press_documents_url(@press_kit) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_press_kit
    @press_kit = PressKit.find(params[:press_kit_id], :include => :press_documents)
  end
  
end

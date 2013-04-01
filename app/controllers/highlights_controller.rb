class HighlightsController < ApplicationController
  
  before_filter :authenticate

  # GET /highlights/1
  # GET /highlights/1.xml
  def show
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @highlight }
    end
  end

  # GET /highlights/1/edit
  def edit
    @highlight = Highlight.find(params[:id])
  end

  # PUT /highlights/1
  # PUT /highlights/1.xml
  def update
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      if @highlight.update_attributes(params[:highlight])
        flash[:notice] = 'Highlight was successfully updated.'
        format.html { redirect_to(@highlight) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @highlight.errors, :status => :unprocessable_entity }
      end
    end
  end

end

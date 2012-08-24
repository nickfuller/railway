class LinesController < ApplicationController

  def index
    @lines = TrainLine.all

     respond_to do |format|
      format.html
      format.json { render :json => @lines }
    end
  end
  
  def new
    @line = TrainLine.new
  end
  
  def create
    @line = TrainLine.new(params[:train_line])

    if @line.save
      redirect_to train_line_url(@line), :notice => "Successfully saved"
    else
      flash[:notice] = "Somtheing wEtN WoRONg!"
      render 'new' # HOW are we rendering 'new' and what is 'new'?
    end
  end

  def show
    @line = TrainLine.find_by_id(params[:id])  # WHERE is this prams[:id] coming from exactly?
    respond_to do |format|
      format.html
      format.json { render :json => @line }
    end
  end
  
  def edit
    @line = TrainLine.find_by_id(params[:id])
  end
  
  def update
    @line = TrainLine.find_by_id(params[:id])

    if @line.update_attributes(params[:train_line])
      redirect_to train_line_url(@line.id)
    else
      flash[:notice] = "Something went wrong."
      render 'edit'
      # It's confusing how "flash" seems to be an action, 
      # yet it comes prior to the object it's acting on
      # (a notice of 'Something...wrong')...Am I thinking about
      # it accurately?
    end
  end

  def destroy
    TrainLine.find_by_id(params[:id]).destroy
    redirect_to train_lines_url
    # CAN I say   redirect_to home  if I put a :as => home
    # in routes.rb?
    # WHY don't we designate an @line variable here?
  end

end
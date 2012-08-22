class LinesController < ApplicationController

  def index
    @lines = TrainLine.all
  end
  
  def new
  end
  
  def create
    @line = TrainLine.new
    @line.name = params[:name]
    @line.frequency = params[:frequency]
    @line.save
    redirect_to 'http://localhost:3000/lines'
  end

  def show
    line_id = params[:id] #<=WHERE is this :id coming from?
    @line = TrainLine.find_by_id(line_id)
  end
  
  def edit
    line_id = params[:id]
    @line = TrainLine.find_by_id(line_id)
  end
  
end

# Just to be clear, the @line in the index action is not at all related to the @line in the create - or 
# any other action, right?
class AttractionsController < ApplicationController

  # GET /attractions - attractions_path
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/:id - attraction_path
  def show
    @attraction = Attraction.find(params[:id])

  end

  # GET /attractions/new - new_attraction_path
  def new
    @attraction = Attraction.new
    redirect_to attractions_path, flash: {error: 'You cannot make a new attraction.'} if !current_user.admin
  end

  # POST /attractions
  def create
    @attraction = Attraction.new(attraction_params)
    redirect_to attractions_path, flash: {error: 'You cannot make a new attraction.'} if !current_user.admin

    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  # GET /attractions/:id/edit - edit_attractions_path
  def edit
    redirect_to attractions_path, flash: {error: 'You cannot edit attractions.'} if !current_user.admin
    @attraction = Attraction.find(params[:id])
  end

  # PATCH/PUT /attractions/:id
  def update
    @attraction = Attraction.find(params[:id])
    redirect_to attractions_path, flash: {error: 'You cannot edit attractions.'} if !current_user.admin

    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end


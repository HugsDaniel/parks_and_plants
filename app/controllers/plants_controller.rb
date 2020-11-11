class PlantsController < ApplicationController
  def destroy
    @plant  = Plant.find(params[:id])
    @garden = @plant.garden
    @plant.destroy

    redirect_to garden_path(@garden)
  end

  def new
    @plant  = Plant.new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @plant  = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])

    @plant.garden = @garden
    # raise

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :photo_url)
  end
end

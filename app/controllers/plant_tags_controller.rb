class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant     = Plant.find(params[:plant_id])
  end

  def create
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant     = Plant.find(params[:plant_id])

    # @garden    = @plant.garden

    @plant_tag.plant = @plant

    if @plant_tag.save
      redirect_to garden_path(@plant.garden), notice: "Tag added !"
    else
      render :new
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end

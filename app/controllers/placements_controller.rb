class PlacementsController < ApplicationController
  before_action :set_placement, only: %i[ show edit destroy update ]

  def index
    # TODO: add pagination
    @placements = Placement.all
  end

  def show
  end

  def new
    @placement = Placement.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def set_placement
    @placement = Placement.find_by_id(params[:id])
  end

  def placement_params
    params.require(:placement).permit(
      :title,
      :description,
      :price,
      {images: []}
    )
  end
end

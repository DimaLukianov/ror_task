class PlacementsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_placement, only: %i[ edit destroy update ]

  def index
    # TODO: add pagination
    @placements = Placement.all
  end

  def show
    @placement = Placement.find_by_id(params[:id])
  end

  def new
    @placement = Placement.new
  end

  def create
    @placement = Placement.new(placement_params)

    if @placement.save
      redirect_to placement_path(@placement), flash: {
        success: {
          message: I18n.t('placement.created'),
        }
      }
    else
      if @placement.errors.details[:lat] &&
         @placement.errors.details[:lat].length > 0 &&
         @placement.errors.details[:lat][0][:error] == :taken
        flash.now[:alert] = {
          title: I18n.t('error'),
          message: I18n.t('placement.errors.add_comment'),
          link: {
            title: I18n.t('placement.errors.show_placement'),
            url: placement_url(Placement.find_by(lat: @placement.lat, lng: @placement.lng ))
          }
        }
      end
      render :new
    end
  end

  def edit
  end

  def update
    if @placement.update(placement_params)
      redirect_to placement_path(@placement), flash: {
        success: { message: I18n.t('placement.updated') }
      }
    else
      render :edit
    end
  end

  def destroy
    if @placement.destroy
      redirect_to placements_path, flash: { success: I18n.t('placement.deleted') }
    else
      redirect_to placement_path(@placement), alert: I18n.t('placement.delete_error')
    end
  end

private
  def set_placement
    @placement = current_user.placements.find_by_id(params[:id])
  end

  def placement_params
    params.require(:placement).permit(
      :title,
      :description,
      :price,
      :currency,
      :formatted_address,
      :street_number,
      :route,
      :locality,
      :region,
      :country,
      :lat,
      :lng,
      {images: []}
    ).merge(user_id: current_user.id)
  end
end

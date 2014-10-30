class PhotoShoutsController < ApplicationController
  def create
    photo_shout = PhotoShout.new(photo_shout_params)
    shout = current_user.shouts.new(content: photo_shout)

    if photo_shout.save && shout.save
      redirect_to homes_path
    else
      flash.alert = "Nothing was shouted"
      redirect_to homes_path
    end
  end

  private

  def photo_shout_params
    if params[:image]
      params.require(:photo_shout).permit(
        :image,
      )
    end
  end
end

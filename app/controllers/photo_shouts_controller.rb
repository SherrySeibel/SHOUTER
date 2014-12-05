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

  def edit
    @photo_shout = PhotoShout.find(params[:id])
  end

  def update
    photo_shout = PhotoShout.find(params[:id])

    if photo_shout.update(photo_shout_params)
      redirect_to homes_path
    else
      render :edit
    end
  end

  def destroy
    photo_shout = PhotoShout.find(params[:id])
    photo_shout.destroy
    redirect_to homes_path
  end

  private

  def photo_shout_params
    params.require(:photo_shout).permit(
      :image,
    ) if params[:image]
  end
end

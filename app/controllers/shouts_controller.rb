class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.build(shout_params)

    if shout.save
      redirect_to homes_path
    else
      flash.alert = "Nothing was shouted"
      redirect_to homes_path
    end
  end

  private

  def shout_params
    params.require(:shout).permit(
      :body,
    )
  end
end

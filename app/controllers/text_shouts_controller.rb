class TextShoutsController < ApplicationController
  def create
    text_shout = TextShout.new(text_shout_params)
    shout = current_user.shouts.new(content: text_shout)

    if text_shout.save && shout.save
      redirect_to homes_path
    else
      flash.alert = "Nothing was shouted"
      redirect_to homes_path
    end
  end

  private

  def text_shout_params
    params.require(:text_shout).permit(
      :body,
    )
  end
end

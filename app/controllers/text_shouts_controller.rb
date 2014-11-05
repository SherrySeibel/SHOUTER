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

  def edit
    @text_shout = TextShout.find(params[:id])
  end

  def update
    text_shout = TextShout.find(params[:id])

    if text_shout.update(text_shout_params)
      redirect_to homes_path
    else
      render :edit
    end
  end

  def destroy
    text_shout = TextShout.find(params[:id])
    text_shout.destroy
    redirect_to homes_path
  end

  private

  def text_shout_params
    params.require(:text_shout).permit(
      :body,
    )
  end
end

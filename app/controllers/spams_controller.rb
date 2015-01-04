class SpamsController < ApplicationController
  def create
    shout = Shout.find(params[:shout_id])
    shout.mark_as_spam
    redirect_to :back
  end
end

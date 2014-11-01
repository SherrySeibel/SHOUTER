class HomesController < ApplicationController
  def show
    @home = Home.new(current_user)
  end
end

class HomesController < ApplicationController
  def show
    @shout = Shout.new
  end
end

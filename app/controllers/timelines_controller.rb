class TimelinesController < ApplicationController
  def show
    @timeline = Timeline.new(current_user)
  end
end

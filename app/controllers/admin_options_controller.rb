class AdminOptionsController < ApplicationController
  def show
    @spam = Shout.where(spam: true)
  end
end

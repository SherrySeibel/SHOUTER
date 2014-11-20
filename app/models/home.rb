class Home
  def initialize(user)
    @user = user
  end

  def new_text_shout
    TextShout.new
  end

  def new_photo_shout
    PhotoShout.new
  end

  def all_shouts
    Shout.all
  end
end

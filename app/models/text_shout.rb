class TextShout < ActiveRecord::Base
  validates :body, presence: true

  has_one :shout, as: :content, dependent: :destroy

  def body=(new_body)
    self[:body] = new_body.upcase
  end
end

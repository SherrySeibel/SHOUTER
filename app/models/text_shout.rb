class TextShout < ActiveRecord::Base
  validates :body, presence: true

  has_many :shouts, as: :content, dependent: :destroy

  def body=(new_body)
    self[:body] = new_body.upcase
  end
end

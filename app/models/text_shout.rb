class TextShout < ActiveRecord::Base
  validates :body, presence: true

  has_one :shout, as: :content, dependent: :destroy

  before_save :upcase_body

  def upcase_body
    self.body = body.upcase
  end
end

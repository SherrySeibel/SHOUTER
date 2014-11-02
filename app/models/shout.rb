class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  default_scope { order(created_at: :desc) }

  def body=(new_body)
    self[:body] = new_body.upcase
  end

  def self.search term
    text_shouts = TextShout.where("body ILIKE ?", "%#{term}%")
    where(content_type: "TextShout", content_id: text_shouts)
  end
end

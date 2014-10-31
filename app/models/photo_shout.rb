class PhotoShout < ActiveRecord::Base
  has_attached_file :image, styles: {
    shout: "200x200>"
  }

  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

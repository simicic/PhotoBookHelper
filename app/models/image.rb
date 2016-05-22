class Image < ActiveRecord::Base
  has_attached_file :image_file, styles: { thumb: "100x100>" }
  validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\Z/
  validates :image_file, presence: true

  belongs_to :tag
end

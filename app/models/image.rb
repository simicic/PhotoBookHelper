class Image < ActiveRecord::Base
  has_attached_file :image_file, styles: { normal: '600x600>', thumb: "100x100>" }
  validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\Z/
  validates :image_file, presence: true

  belongs_to :tag
  belongs_to :event
end

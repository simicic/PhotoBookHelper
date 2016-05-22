class Event < ActiveRecord::Base
  validates :name, presence: true

  has_many :images
  accepts_nested_attributes_for :images
end

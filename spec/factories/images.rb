FactoryGirl.define do
  factory :image do
    image_file { File.new(File.join(Rails.root, 'support', 'image.jpg')) }
    tag
  end
end

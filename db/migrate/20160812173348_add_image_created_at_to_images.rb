class AddImageCreatedAtToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_taken_at, :datetime

    Image.find_each do |image|
      time = EXIFR::JPEG.new(image.image_file.path).date_time
      image.update_attributes(image_taken_at: time)
    end

    Event.find_each do |event|
      images = event.images.order(:image_taken_at)
      images.update_all(position: nil)
      images.each_with_index do |image, index|
        image.insert_at(index)
      end
    end
  end
end

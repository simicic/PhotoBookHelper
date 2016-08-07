desc 'Move tagged images into desktop folder'
task :move_tagged_images, [:tag_id, :event_id] => :environment do |t, args|
  images = Image.where(tag_id: args.tag_id, event_id: args.event_id)

  folder_to = FileUtils.mkdir("#{ENV['HOME']}/Desktop/export_event_#{args.event_id}_#{Time.now.strftime("%H%M%S")}")

  images.each do |image|
    new_file = folder_to.first + '/' + image.image_file.original_filename
    FileUtils.cp(image.image_file.path, new_file)
  end
end

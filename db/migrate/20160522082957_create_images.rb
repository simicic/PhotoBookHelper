class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image_file
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

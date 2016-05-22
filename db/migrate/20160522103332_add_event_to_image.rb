class AddEventToImage < ActiveRecord::Migration
  def change
    add_column :images, :event_id, :integer, index: true, foreign_key: true
  end
end

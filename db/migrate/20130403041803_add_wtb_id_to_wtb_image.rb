class AddWtbIdToWtbImage < ActiveRecord::Migration
  def change
    add_column :wtb_images, :wtb_id, :integer
  end
end

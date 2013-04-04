class AddWtsidToWtsImage < ActiveRecord::Migration
  def change
    add_column :wts_images, :wts_id, :integer
  end
end

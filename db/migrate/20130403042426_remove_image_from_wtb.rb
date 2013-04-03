class RemoveImageFromWtb < ActiveRecord::Migration
  def up
    remove_column :wtbs, :image
  end

  def down
    add_column :wtbs, :image, :string
  end
end

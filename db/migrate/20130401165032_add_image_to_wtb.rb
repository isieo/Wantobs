class AddImageToWtb < ActiveRecord::Migration
  def change
    add_column :wtbs, :image, :string
  end
end

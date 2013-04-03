class AddWtbIdToWtb < ActiveRecord::Migration
  def change
    add_column :wtbs, :wtb_id, :integer
  end
end

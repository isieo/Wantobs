class RemoveWtbIdFromWtb < ActiveRecord::Migration
  def up
    remove_column :wtbs, :wtb_id
  end

  def down
    add_column :wtbs, :wtb_id, :integer
  end
end

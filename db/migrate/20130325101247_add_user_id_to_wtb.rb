class AddUserIdToWtb < ActiveRecord::Migration
  def change
    add_column :wtbs, :user_id, :integer
  end
end

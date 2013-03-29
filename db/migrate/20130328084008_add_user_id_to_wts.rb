class AddUserIdToWts < ActiveRecord::Migration
  def change
    add_column :wts, :user_id, :integer
  end
end

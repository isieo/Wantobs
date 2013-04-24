class AddCommentedtomeColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :commented_to_me_id, :integer
  end
end

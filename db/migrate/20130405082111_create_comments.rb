class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :wts_id
      t.integer :wtb_id
      t.text :comment

      t.timestamps
    end
  end
end

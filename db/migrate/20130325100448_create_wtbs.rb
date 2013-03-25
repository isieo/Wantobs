class CreateWtbs < ActiveRecord::Migration
  def change
    create_table :wtbs do |t|
      t.string :item
      t.string :budget
      t.string :quantity
      t.string :additional_info
      t.string :links
      t.hstore :properties

      t.timestamps
    end
  end
end

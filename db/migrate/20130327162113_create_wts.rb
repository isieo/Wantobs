class CreateWts < ActiveRecord::Migration
  def change
    create_table :wts do |t|
      t.string :item
      t.string :price
      t.string :quantity
      t.string :information
      t.string :links
      t.string :used
      t.string :warranty
      t.string :contactmethod
      t.string :paymentmethod
      t.string :pickup

      t.timestamps
    end
  end
end

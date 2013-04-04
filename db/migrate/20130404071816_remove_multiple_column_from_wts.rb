class RemoveMultipleColumnFromWts < ActiveRecord::Migration
  def up
    remove_column :wts, :price
    remove_column :wts, :information
    remove_column :wts, :warranty
    remove_column :wts, :contactmethod
    remove_column :wts, :paymentmethod
    remove_column :wts, :pickup
  end

  def down
    add_column :wts, :pickup, :string
    add_column :wts, :paymentmethod, :string
    add_column :wts, :contactmethod, :string
    add_column :wts, :warranty, :string
    add_column :wts, :information, :string
    add_column :wts, :price, :string
  end
end

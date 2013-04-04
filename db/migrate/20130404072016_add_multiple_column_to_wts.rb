class AddMultipleColumnToWts < ActiveRecord::Migration
  def change
    add_column :wts, :properties, :hstore
  end
end

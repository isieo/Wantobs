class AddSlugToWts < ActiveRecord::Migration
  def change
    add_column :wts, :slug, :string
  end
end

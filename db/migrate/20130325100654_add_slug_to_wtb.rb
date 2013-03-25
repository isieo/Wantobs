class AddSlugToWtb < ActiveRecord::Migration
  def change
    add_column :wtbs, :slug, :string
  end
end

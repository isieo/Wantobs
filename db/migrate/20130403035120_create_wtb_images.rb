class CreateWtbImages < ActiveRecord::Migration
  def change
    create_table :wtb_images do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end

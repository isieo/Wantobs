class CreateWtsImages < ActiveRecord::Migration
  def change
    create_table :wts_images do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end

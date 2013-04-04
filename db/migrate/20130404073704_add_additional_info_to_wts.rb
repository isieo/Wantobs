class AddAdditionalInfoToWts < ActiveRecord::Migration
  def change
    add_column :wts, :additional_info, :string
  end
end

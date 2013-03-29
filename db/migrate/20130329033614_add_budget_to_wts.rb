class AddBudgetToWts < ActiveRecord::Migration
  def change
    add_column :wts, :budget, :string
  end
end

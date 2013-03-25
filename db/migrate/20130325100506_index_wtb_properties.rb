class IndexWtbProperties < ActiveRecord::Migration
  def up
    execute "CREATE INDEX wtb_properties ON wtbs USING GIN(properties)"
  end

  def down
    execute "DROP INDEX wtb_properties"
  end
end

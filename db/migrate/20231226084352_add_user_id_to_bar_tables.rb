class AddUserIdToBarTables < ActiveRecord::Migration[7.1]
  def change
    add_column :bar_tables, :user_id, :integer
    add_index :bar_tables, :user_id
  end
end

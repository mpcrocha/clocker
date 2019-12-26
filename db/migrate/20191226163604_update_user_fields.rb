class UpdateUserFields < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :email
    change_column :users, :email, :string, unique: false, null: true
  end
end

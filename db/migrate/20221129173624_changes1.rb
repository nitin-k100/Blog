class Changes1 < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_name, :integer
    add_foreign_key :comments, :users, column: :user_name, primary_key: 'username'
  end
end

class Changes < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :post_name, :unique => true
    add_foreign_key :posts, :users, column: :userid
  end
end
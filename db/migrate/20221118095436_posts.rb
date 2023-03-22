class Posts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts , :post_name ,:string
    add_column :posts, :post_type, :string
    add_column :posts, :user_id, :integer
  end
end

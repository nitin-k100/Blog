class Comment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments ,:post_id ,:integer
    add_column :comments ,:description ,:text
  end
end

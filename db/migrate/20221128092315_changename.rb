class Changename < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :post_type, :post_description
  end
end

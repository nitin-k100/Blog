class Change < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :userid, :user_id
  end
end

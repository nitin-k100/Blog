class AddPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password, :string
    remove_column :users, :password_digest
  end
end


#tweet = Tweet.create(id:1, description: "hye", user_id: 1601807279355219968)
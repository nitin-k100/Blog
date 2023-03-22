class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user, class_name: 'User' ,foreign_key: 'user_id'
    validates :post_name, presence: true
    validates :post_description, presence: true             
end

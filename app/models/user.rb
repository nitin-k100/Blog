class User < ApplicationRecord
    has_many :posts, dependent: :destroy, foreign_key: 'user_id', class_name: 'Post'
    validates :username, presence:true, uniqueness: true
    validates :password, length: {minimum: 10}, uniqueness: true
    has_secure_password
end

class User < ApplicationRecord
  has_secure_password
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy

end

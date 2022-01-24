class User < ApplicationRecord
  has_secure_password
  has_many :post_images, dependent: :destroy
end

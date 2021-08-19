class User < ApplicationRecord
    has_secure_password
    has_many :notes, dependent: :destroy
    
    VALID_NAME_REGEX = /\A\w+\z/
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }, format: { with: VALID_NAME_REGEX }
    validates :password, presence: true, length: { minimum: 6 }
end

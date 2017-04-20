class User < ApplicationRecord
  
  before_save { self.user_id = user_id.downcase }
  
  validates :user_id, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }                  
end

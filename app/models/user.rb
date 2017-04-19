class User < ApplicationRecord
  before_save { self.u_id = u_id.downcase }
  
  validates :u_id, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }                  
end

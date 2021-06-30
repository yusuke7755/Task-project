class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :tasks, dependent: :destroy

  before_update :validate_last_admin
  before_destroy :validate_last_admin

  def validate_last_admin
    if User.where(admin: true).count == 1 && self.admin == false
      errors.add(:admin,"は、最低でも１人は必要です。")
      throw(:abort)
    end
  end

end



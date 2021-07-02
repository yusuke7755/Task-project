class Admin::User < ApplicationRecord

  before_destroy :ensure_admin_deatroy
  before_update :ensure_admin_update

  def ensure_admin_deatroy
    throw(:abort) if User.where(admin: true).count <= 1 && self.admin == true
  end

  def ensure_admin_update
    if User.where(admin: true).count == 1 && self.admin == false
      errors.add(:admin,"は、最低でも１人は必要です。")
      throw(:abort)
    end
  end
  
end

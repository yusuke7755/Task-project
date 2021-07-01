class Admin::User < ApplicationRecord

 ##def validate_last_admin
   # if User.where(admin: true).count == 1 && self.admin == false
    #  errors.add(:admin,"は、最低でも１人は必要です。")
    #  throw(:abort)
  #  end
 # end
end

module Admin
  def self.table_name_prefix
    'admin_'
  end
  #before_update :validate_last_admin
  #before_destroy :validate_last_admin

  def validate_last_admin
    if User.where(admin: true).count == 1 && self.admin == false
      errors.add(:admin,"は、最低でも１人は必要です。")
      throw(:abort)
    end
  end
end

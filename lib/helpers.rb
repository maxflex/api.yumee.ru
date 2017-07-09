module Helpers
  def self.to_phone(phone)
    phone.gsub!(/[^0-9]/, '')
    phone = '7' + phone if phone[0] != '7'
    raise 'Invalid phone number' if (phone.length != 11 || ![4, 9].include?(phone[1].to_i))
    phone
  end
end
class User < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :plan, optional: true
  accepts_nested_attributes_for :address, reject_if: :all_blank

  def authenticate(code)
    true
  end

  def self.from_token_request(request)
    phone = Helpers.to_phone(request.params['auth']['phone'])
    code = request.params['auth']['code']
    sms_code = Rails.cache.read("yumee:codes:#{phone}")
    if code.to_s == sms_code.to_s
      return self.find_or_create_by(phone: phone)
    end
  end
end

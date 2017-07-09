class User < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :plan, optional: true

  def authenticate(code)
    true
  end

  def self.from_token_request(request)
    phone = Helpers.to_phone(request.params['auth']['phone'])
    code = request.params['auth']['code']
    sms_code = Rails.cache.read("yumee:codes:#{phone}")
    logger.debug(code.to_s + ' | ' + sms_code.to_s + ' | ' + phone.to_s)
    if code.to_s == sms_code.to_s
      return self.find_or_create_by(phone: phone)
    end
  end

end

require 'open-uri'

module SMS
  def self.send(phone, text)
    params = {
      api_id: Rails.application.secrets.sms_api_key,
      to:     Helpers.to_phone(phone),
      msg:    text,
      from:   'Yumee',
      json:    1
    }
    open('https://sms.ru/sms/send?' + params.to_query).read
  end

  # def self.send(phone, text)
  #   params = {
  #     login: Rails.application.secrets.sms_login,
  #     password: Rails.application.secrets.sms_api_key,
  #     to: Helpers.to_phone(phone),
  #     text: text,
  #     from: 'Yumee'
  #   }
  #   open('https://gate.smsaero.ru/send/?' + params.to_query).read
  # end

  def self.code(phone)
    code = rand(1000..9999)
    send(phone, code.to_s + ' – код для входа')
    code
  end
end
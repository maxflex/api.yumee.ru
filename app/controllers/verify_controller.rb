class VerifyController < ApplicationController
  skip_before_action :authenticate_user

  def verify
    begin
      phone = Helpers.to_phone(params[:phone])
      code = Rails.cache.fetch("yumee:codes:#{phone}", expires_in: 2.minutes) do
        SMS.code(phone)
      end
      head :ok
    rescue
      render json: {error: 'wrong number'}, status: :unprocessable_entity
    end
  end


end

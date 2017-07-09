class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user, :set_format

  def set_format
    request.format = 'json'
  end
end

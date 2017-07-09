class PlansController < ApplicationController
  # skip_before_action :authenticate_user

  def index
    @plans = Plan.all
    render json: @plans
  end
end

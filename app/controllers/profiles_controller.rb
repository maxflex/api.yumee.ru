class ProfilesController < ApplicationController
  def show
    @current_user = current_user
    render :show, status: :ok
  end

  def update
    if current_user.update_attributes(user_params)
      head :ok
    else
      render json: current_user.errors, :status => :unprocessable_entity
    end
  end

  private

  def user_params
    user_params = params.permit(:name, :preferences, :plan_id, :age, :height, :weight,
      address: [:street, :building, :corpus, :stroenie, :flat, :lat, :lng, :domofon, :comment, :floor],
    )
    user_params[:address_attributes] = user_params.delete(:address) if user_params.has_key?(:address)
    user_params.permit!
  end
end

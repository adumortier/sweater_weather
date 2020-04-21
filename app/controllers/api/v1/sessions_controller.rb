class Api::V1::SessionsController < ApplicationController

  def create
    user = User.where(email: user_params[:email]).first
    return render json: Error.serialize('Invalid email/password'), status: 400 if invalid_user?(user)

    return render json: user.serialize, status: 201
  end

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def invalid_user?(user)
    user.nil? || !user.authenticate(user_params[:password])
  end

end
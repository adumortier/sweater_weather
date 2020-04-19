class Api::V1::SessionsController < ApplicationController

  def create
    user = User.where(email: user_params[:email]).first
    if user.nil? || (!user.authenticate(user_params[:password]))
      render json: ErrorSerializer.new(Error.new('Your email and/or password are invalid')), status: 400
    else
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
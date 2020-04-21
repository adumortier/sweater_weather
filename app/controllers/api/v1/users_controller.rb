class Api::V1::UsersController < ApplicationController

  def create
    return render json: Error.serialize('email, password and confirmation can not be empty'), status: 400 if missing_field?

    return render json: Error.serialize('password and confirmation do not match'), status: 400 if mismatching_password?

    user = User.get_user(user_params)
    return render json: Error.serialize('credentials do not match'), status: 400 if invalid_password?(user)

    user.save
    render json: user.serialize, status: 201
  end

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def invalid_password?(user)
    !user.authenticate(user_params[:password])
  end

  def mismatching_password?
    user_params[:password] != user_params[:password_confirmation]
  end

  def missing_field?
    user_params[:password] == '' || user_params[:password_confirmation] == '' || user_params[:email] == '' ||
    user_params[:password].nil? || user_params[:password_confirmation].nil? || user_params[:email].nil?
  end
end
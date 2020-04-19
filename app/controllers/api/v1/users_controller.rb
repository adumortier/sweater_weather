class Api::V1::UsersController < ApplicationController

  def create
    if user_params[:password]=='' || user_params[:password_confirmation] ==''
      return render json: ErrorSerializer.new(Error.new('password and confirmation password can not be empty')), status: 400
    end

    if valid_query?
      user = User.get_user(user_params)
      if user.authenticate(user_params[:password])
        user.save
        render json: UsersSerializer.new(user), status: 201
      else
        render json: ErrorSerializer.new(Error.new('Email and password credentials do not match')), status: 400
      end
    else
      render json: ErrorSerializer.new(Error.new('password and password confirmation do not match')), status: 400
    end
    
  end

  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def valid_query?
    (user_params[:password] == user_params[:password_confirmation]) || (user_params[:password] =='') || (user_params[:password_confirmation] =='')
  end
end
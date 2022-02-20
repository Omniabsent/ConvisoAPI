class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Username or email alredy in use"}, :status => 400
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(name: params[:name])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}, :status => 400
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :password, :email)
  end

end

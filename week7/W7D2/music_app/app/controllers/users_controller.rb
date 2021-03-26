class UsersController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user.save
      session[:session_token] = user.session_token
      login_user!(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end


end

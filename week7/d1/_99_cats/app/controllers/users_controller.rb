class UsersController < ApplicationController
  before_action :require_logged_in, except: [:create, :new]

  def new
    user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user.id)
    else
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end

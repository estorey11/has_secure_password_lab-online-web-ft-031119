class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    binding.pry
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'home'
  end
  
  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

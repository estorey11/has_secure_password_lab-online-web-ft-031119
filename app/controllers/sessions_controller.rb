class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    binding.pry
    redirect_to controller: 'users', action: 'home'
  end
end

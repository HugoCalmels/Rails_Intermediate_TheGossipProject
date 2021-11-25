class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: "You connected successfully !"
    elsif user.nil?
      redirect_to new_session_path, danger: "Please enter a correct Email"
    else 
      redirect_to new_session_path, danger: "Wrong password !"
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: "You disconnected successfully !"
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    City.all.map do |el|
      if el.id == params[:city].to_i
        @city = el
      end
    end

    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: @city
    ) 

    if @user.save
      redirect_to root_path, success: "User created Successfully!"
    else 
      redirect_to new_user_path, danger: @user.errors.full_messages
    end
  end

end

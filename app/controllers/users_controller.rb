class UsersController < ApplicationController
def new
end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    puts "*********** SAVED"
    redirect_to '/'
  else
    puts "User not found: redirecting the page"
    redirect_to '/signup'
  end
end

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

   
end
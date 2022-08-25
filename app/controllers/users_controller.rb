class UsersController < ApplicationController
  def show
   #@usercar = @user.cars
   @usercars = current_user.cars
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = user.name
    @post = user.post
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @categories = @user.imports.select(:category).distinct
    @dates = @user.imports.select(:date).distinct.sort
  end
end

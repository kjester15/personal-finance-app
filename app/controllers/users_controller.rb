class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @categories = @user.imports.select(:category).distinct
    @total = @user.imports.sum(:amount)
  end
end

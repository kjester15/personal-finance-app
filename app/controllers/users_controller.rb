class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  private

  def import_params
    params.require(:name).permit(:file, :name)
  end
end

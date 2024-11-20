class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @options = []
    current_user.imports.select(:name).distinct.order(name: :asc).each do |import|
      @options << import.name
    end
    @categories = current_user.imports.select(:category).distinct.order(category: :asc)
    @dates = @user.imports.select(:date).distinct.order(date: :asc)
    @vendors = @user.imports.select(:vendor).distinct.order(vendor: :asc)
    @cards = @user.imports.select(:card).distinct.order(card: :asc)
  end

  private

  def import_params
    params.require(:import).permit(:file, :name)
  end
end

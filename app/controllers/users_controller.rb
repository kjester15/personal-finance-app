class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @categories = current_user.imports.select(:category).distinct.order(category: :asc)
    @dates = @user.imports.select(:date).distinct.order(date: :asc)
    @vendors = @user.imports.select(:vendor).distinct.order(vendor: :asc)
    @cards = @user.imports.select(:card).distinct.order(card: :asc)
  end
end

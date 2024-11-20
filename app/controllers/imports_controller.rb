require 'csv'

class ImportsController < ApplicationController
  def index
    @imports = Import.select(:name).distinct.order(name: :asc)
  end

  def show
    @imports = Import.where(user: current_user, name: params[:id])
    @categories = @imports.select(:category).distinct.order(category: :asc)
    @dates = @imports.select(:date).distinct.order(date: :asc)
    @vendors = @imports.select(:vendor).distinct.order(vendor: :asc)
    @cards = @imports.select(:card).distinct.order(card: :asc)
  end

  def new
    @import = Import.new
  end

  def create
    CSV.foreach(import_params[:file], headers: true) do |row|
      current_user.imports.create!(name: import_params[:name],
                                   date: row[0],
                                   amount: row[1],
                                   card: row[2],
                                   category: row[3],
                                   vendor: row[4])
      # if @import.save
      #   redirect_to import_path(@import.id)
      # else
      #   render :new, status: :unprocessable_entity
      # end
    end
    redirect_to import_path(import_params[:name])
  end

  # def edit
  #   @import = Import.find(params[:id])
  # end

  # def update
  #   @import = Import.find(params[:id])

  #   if @import.update(import_params)
  #     redirect_to posts_path(@import.id)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to :root
  end

  private

  def import_params
    params.require(:import).permit(:file, :name)
  end
end

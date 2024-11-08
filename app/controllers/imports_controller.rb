class ImportsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @imports = Import.all
  end

  def show
    @import = Import.find(params[:id])
  end

  def new
    @import = Import.new
  end

  def create
    @import = current_user.imports.build(import_params)

    if @import.save
      redirect_to import_path(@import.id)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:import).permit(:file)
  end
end

class PressController < ApplicationController
  before_action :check_admin
  before_action :find_press, only: [:edit, :update]
  layout 'user'

  def index
    @press = Press.all
  end

  def new
    @press = Press.new
  end

  def create
    @press = Press.new(press_params)
    if @press.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @press.update(press_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def find_press
     @press = Press.find(params[:id])
  end

  def press_params
    params.require(:press).permit(:title, :url, :pubdate)
  end
end

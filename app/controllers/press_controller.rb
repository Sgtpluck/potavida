class PressController < ApplicationController
  before_action :check_admin

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

  private

  def press_params
    params.require(:press).permit(:title, :url, :pubdate)
  end
end

class PicksController < ApplicationController

  def create
    @pick = Pick.new
    temp = Icon.find(params[:format]).name
    @pick.icon = temp
    authorize @pick
    @pick.save
    redirect_to icons_path
  end


end

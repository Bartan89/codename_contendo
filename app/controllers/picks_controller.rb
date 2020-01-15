class PicksController < ApplicationController

  def create
    @pick = Pick.new
    @pick.user = current_user
    @pick.icon = Icon.find(params[:format])
    authorize @pick
    @pick.save
    redirect_to icons_path
  end

  def destroy
     @pick = Pick.find(params[:id])
     @pick.destroy
     authorize @pick
  end
end

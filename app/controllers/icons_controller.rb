class IconsController < ApplicationController

  def index
    @icons = Icon.all
    @icons = policy_scope(Icon)
    @picks = Pick.all
  end


  def new
    @icon = Icon.new
    authorize @icon
  end


  def create
    @icon = Icon.new(icon_params)
    authorize @icon
    # @icon.user_id = current_user.id
    if @icon.save
      redirect_to icons_path
    else
      render :new
    end
  end




  private

  def icon_params
    params.require(:icon).permit(:json, :name, :hidden)
  end


end

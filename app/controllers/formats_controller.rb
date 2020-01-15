class FormatsController < ApplicationController

  def index
    @picks = Pick.all
    @icons = Icon.all
    @formats = Format.all
    @formats = policy_scope(Format)
  end

  def show
    @icons = Icon.all
    @picks = Pick.all
    @format = Format.find(params[:id])
    @scenes = Scene.new
    authorize @format
  end

end

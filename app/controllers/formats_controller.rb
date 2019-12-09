class FormatsController < ApplicationController

  def index
    @icons = Icon.all
    @formats = Format.all
    @formats = policy_scope(Format)
  end

  def show
    @format = Format.find(params[:id])
    authorize @format
  end

end

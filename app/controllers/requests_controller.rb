class RequestsController < ApplicationController
  def create
    translation = Translation.find(params[:translation_id])
    @request = Request.create(user: current_user, translation: translation)
    authorize @request
    redirect_to dashboard_path(current_user)
  end

  def destroy
    @temp = Request.find(params[:id])
    authorize @temp
    @temp.destroy
    redirect_to dashboard_path(current_user.id)
  end

  def update
        @request = Request.find(params[:id])
    authorize @request
    @request.completed = true;
    @request.save
    redirect_to inbox_path
  end
end

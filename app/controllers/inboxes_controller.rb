class InboxesController < ApplicationController

  def show
    @requests = current_user.requests.order(created_at: :desc).where(completed: false)
    @fulfilled = current_user.requests.order(created_at: :desc).where(completed: true)
    @videos = current_user.videos
    @unpublished = current_user.translations.where(done: false)
    @published = current_user.translations.where(done: true)
    authorize @videos
  end

  def update
    @request = Request.find(params[:id])
    authorize @request
    @request.completed = true;
    @request.save
    redirect_to inbox_path
  end
end


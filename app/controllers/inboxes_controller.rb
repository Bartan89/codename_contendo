class InboxesController < ApplicationController

  def show
    @requests = current_user.requests
    @videos = current_user.videos
    @unpublished = current_user.translations.where(done: false)
    @published = current_user.translations.where(done: true)
    authorize @videos
  end

end

class DashboardsController < ApplicationController

  def show
    @videos = User.find(params[:id]).videos_as_shepherd
    authorize @videos
    @translations_with_requests = @videos.map do |video|
      video.translations.joins(:requests)
    end.flatten.uniq

  end
end

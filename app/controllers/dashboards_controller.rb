class DashboardsController < ApplicationController

  def show
    @icons = Icon.all
    @videos = Video.all.where(:user_id == current_user.id)
    @requests = current_user.requests.order(created_at: :desc).where(completed: false)
    @videos_shepherd = User.find(params[:id]).videos_as_shepherd
    authorize @videos
    @jobs = @videos.map do |video|
      video.translations.joins(:requests)
    end.flatten.uniq
  end

end

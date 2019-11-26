class VideosController < ApplicationController
  def index
    @videos = policy_scope(Video)
  end


  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(video_params)
    authorize @video
    @video.user_id = current_user.id
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
    @edit_translations = @video.translations[1..@video.translations.count-1]
    @published_translations = @edit_translations.select do |t|
      t.done = true
    end
  end

  def destroy
   temp = Video.find(params[:id])
   temp.destroy
   redirect_to videos_path
  end




  private

  def video_params
    params.require(:video).permit(:video_path, :name)
  end
end

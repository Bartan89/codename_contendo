class VideosController < ApplicationController
  def index
    @videos = Video.all
  end


  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def destroy
   temp = Video.find(params[:id])
   temp.delete
   redirect_to videos_path
  end




  private

  def video_params
    params.require(:video).permit(:video_path, :name)
  end
end

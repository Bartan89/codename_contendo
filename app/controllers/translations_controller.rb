class TranslationsController < ApplicationController
  def new
      @video = Video.find(params[:video_id])
      @translation = Translation.new
  end

  def create
    @video = Video.find(params[:video_id])
    @translation = Translation.new(sanitised_params)
    @translation.video = @video
    @translation.user = current_user
    if @translation.save
      redirect_to video_path(@video)
    else
      render :new
    end
  end

  def edit
      @video = Video.find(params[:video_id])
      @translation = Translation.find(params[:id])
  end

  def update
    @video = Video.find(params[:video_id])
    @translation = Translation.find(params[:id])
    if @translation.update(sanitised_params)
      redirect_to video_path(@video)
    else
      render :edit
    end
  end

  private

  def sanitised_params
    params.require(:translation).permit(:json)
  end
end

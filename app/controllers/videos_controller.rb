require 'will_paginate/array'
class VideosController < ApplicationController
  def index
    @tags = Tag.all
    @videos = policy_scope(Video)
    if params[:query].present?
      @videos = Video.search_by_name_and_video_path(params[:query])
    elsif params[:tag].present?
      @tag = Tag.where(tag: params[:tag])
      @videos = Video.joins(:tags).where('tags.tag = ?', params[:tag])
    else
      @videos = Video.all
    end
    @videos_sorted = Video.paginate(page: params[:page], per_page: 2)
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
    @icons = Icon.all
    @video = Video.find(params[:id])
    authorize @video
    @edit_translations = @video.translations[1..@video.translations.count-1]

    unless @edit_translations.nil?
      @published_translations = @edit_translations.select do |t|
        t.done == true
      end
      @my_translations = @edit_translations.select {|t| t.user == current_user}
    end
    if current_user.id != @video.user_id
      @video.engagement += 1
      @video.save
    end
  end

  def destroy
   @temp = Video.find(params[:id])
   authorize @temp
   @temp.destroy
   redirect_to inbox_path(current_user.id)
  end


  def shepherd
    @video = Video.find(params[:id])
    authorize @video
    @video.shepherd_id = current_user.id
    @video.save
    redirect_to video_path(@video)
end


def revoke
  @video = Video.find(params[:id])
  authorize @video
  @video.shepherd_id = nil
  @video.save
  redirect_to video_path(@video)
end

  private

  def video_params
    params.require(:video).permit(:video_path, :name, :description)
  end
end


















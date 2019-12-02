class TagsController < ApplicationController

  def show
    @video = Video.find(params[:id])
    authorize @video
    @tags = Tag.all.order('tag ASC')
  end

  def create
    @tag = Tag.find(params[:dashboard_id])
    authorize @tag
    VideosTag.create(video_id: params[:format], tag_id: params[:dashboard_id])
    # temp = Tag.create(:tag => Tag.find(params[:dashboard_id]).tag)
    # x = VideosTags.create(:video_id => params[:format], :tag_id => temp.id)
    redirect_to dashboard_tag_path(params[:dashboard_id] , params[:format])
  end

  def destroy
    @tag = Tag.find(params[:dashboard_id])
    temp = @tag.tag
    authorize @tag
    @tag.destroy
    Tag.create(:tag => temp)
    redirect_to dashboard_tag_path(params[:dashboard_id] , params[:id])
  end
end

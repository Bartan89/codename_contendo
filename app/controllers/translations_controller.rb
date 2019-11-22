require 'json'

class TranslationsController < ApplicationController
  def new
    @video = Video.find(params[:video_id])
    if @video.translations.length == 0
    @translation = Translation.new
    else
    #after transcript:
  end
end

  def create
    @video = Video.find(params[:video_id])

    ### CREATING TRANSCRIPT
    if @video.translations.length == 0 #checking if this is the transcript
      @translation = Translation.new(sanitised_params)
      @translation.video = @video
      @translation.user = current_user
      json_to_lines(@translation) #create lines and set them to translation

      if @translation.save
          redirect_to translation_path(@translation)
      else
        render :new
      end
    ### CREATING ADDITIONAL TRANSLATIONS
    else # if not the transcript, clone transcript and take to edit page
      @translation = clone_translation(@video)

      if @translation.save
          redirect_to edit_translation_path(@translation)
      else
        render :new
      end
    end
  end

  def edit
      @translation = Translation.find(params[:id])
  end

  def update
    @translation = Translation.find(params[:id])

    @translation.lines.length.times do |i|
       line = Line.find(line_params["lines_attributes"][i.to_s]["id"])
       line.update(content: line_params["lines_attributes"][i.to_s]["content"])
     end

    @translation.language = params[:translation][:language]
    @translation.json = LinesToJsonService.to_json(@translation.lines.order('created_at ASC'))

    if @translation.save
      redirect_to translation_path(@translation)
    else
      render :edit
    end
  end

  def show
    @translation = Translation.find(params[:id])
    @lines = @translation.lines.order('created_at ASC')
  end

  def destroy
   temp = Translation.find(params[:id])
    video = Video.find(temp.video_id)
   temp.destroy
   redirect_to video_path(video)
  end


  private
    def json_to_lines(translation)
      r_hash = JSON.parse(translation.json).to_a
      r_hash.each do |key, value|
        Line.create(title: key, content: value, translation: translation)
      end
    end

    def clone_translation(video)
      new_translation = Translation.create(video: video, user: current_user)
      clone_mold = video.translations.first.lines

      clone_mold.to_a.each do |line|
          Line.create(title: line.title, content: line.content, translation: new_translation)
      end

      return new_translation
    end

    def sanitised_params
      params.require(:translation).permit(:json)
    end

    def line_params
      params.require(:translation).permit(:language, [lines_attributes: {}])
    end
end

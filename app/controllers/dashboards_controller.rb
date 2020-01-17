class DashboardsController < ApplicationController

  def show
    rating
    @icons = Icon.all
    @videos = current_user.videos
    @requests = current_user.requests.order(created_at: :desc).where(completed: false)
    @videos_shepherd = User.find(params[:id]).videos_as_shepherd
    authorize @videos
    @jobs = @videos.map do |video|
      video.translations.joins(:requests)
    end.flatten.uniq
    @fulfilled = current_user.requests.order(created_at: :desc).where(completed: true)
  end


    def rating
    total = 0
    total += current_user.videos.count/8.0
    total += current_user.requests.count/8.0
    total += current_user.translations.count/8.0
    @counter = total

    @rating =5

    @stars = ""
    @old_stars = "★★★★★"
      min = 5
        total.round.times do
          @stars += "★"
          min -= 1
          @old_stars = @old_stars[1..min]
        end
      motivating_sentence
    end

    def motivating_sentence
  sentence_one = ["You can do it!", "let's star(t)!"].sample
  sentences = [sentence_one,"First star is close", "Humble beginnings!", "You are almost there!", "Keep 'em coming", "Three stars, perfect", "you are a true contributor", "Four stars, incredible!", "Amazing", "Can I call you master-contributor?"]
  index = @counter*2

  @motivational_sentence = sentences[index]
end

end

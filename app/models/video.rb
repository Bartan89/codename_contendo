class Video < ApplicationRecord
  belongs_to :user
  has_many :translations, dependent: :destroy

  has_many :videos_tags
  has_many :tags, through: :videos_tags

  belongs_to :shepherd, class_name: "User", optional: true


  validate :url_must_start_with

  def url_must_start_with
    if !video_path.starts_with? 'https://www.youtube.com/embed/'
      errors.add(:video_path, "errorr. The platform currently only supports embedding videos that are hosted on YouTube. To add a video use the 'embed link' provided by YouTube. It can be found under the 'Share' options with any video. Also make sure you set your video to 'unlisted' in the 'setting panel' of YouTube or straight away when uploading. ")
    end
  end


  include PgSearch::Model
      pg_search_scope :search_by_name_and_video_path,
    against: [ :name, :project_path ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }



end

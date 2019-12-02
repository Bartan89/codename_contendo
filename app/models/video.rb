class Video < ApplicationRecord
  belongs_to :user
  has_many :translations, dependent: :destroy

  has_many :videos_tags
  has_many :tags, through: :videos_tags

  belongs_to :shepherd, class_name: "User", optional: true
end

class Video < ApplicationRecord
  belongs_to :user
  has_many :translations, dependent: :destroy

  belongs_to :shephard, class_name: "User", optional: true
end

class Tag < ApplicationRecord
  has_many :videos_tags, dependent: :destroy
  has_many :videos, through: :videos_tags
end

class Format < ApplicationRecord
  has_many :scenes
  has_many :choices
  # has_many :icons
end

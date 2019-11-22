class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :video
  has_many :lines, dependent: :destroy
  accepts_nested_attributes_for :lines
end


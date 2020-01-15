class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :icon
  # validates :icon, uniqueness: true
end



class Translation < ApplicationRecord
  belongs_to :user
  belongs_to :video
  has_many :lines, dependent: :destroy
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :lines




  # validate :qotation_must_be_double


  # def qotation_must_be_double
  #   translation.json.split('').each do |letter|
  #     if letter == "'"
  #       errors.add(:json, "error. A json string should be created with double qotation")
  #     end
  #   end
  # end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests
  has_many :videos
  has_many :translations
  has_many :videos_as_shepherd, class_name: 'Video', foreign_key: :shepherd_id
  has_many :picks
end

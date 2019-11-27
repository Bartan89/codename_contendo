class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests
  has_many :videos
  has_many :translations
  has_many :videos_as_shephard, class_name: 'Video', foreign_key: :shephard_id

end

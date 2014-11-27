class Photo < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments, as: :commentable
	mount_uploader :image,ImageUploader
	validates :image,presence: :true
end

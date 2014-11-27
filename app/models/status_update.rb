class StatusUpdate < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	validates :post,presence: :true
	has_many :comments, as: :commentable
end

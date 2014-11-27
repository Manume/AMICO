class User < ActiveRecord::Base
	has_many :photos,dependent: :destroy
	has_many :status_updates,dependent: :destroy
	#has_may :likes,dependent: :destroy
	has_many :comments,dependent: :destroy
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable 
  mount_uploader :profile_pic,ProfilePicUploader
end

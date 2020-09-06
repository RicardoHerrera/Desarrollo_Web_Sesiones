class Author < ApplicationRecord

	has_many :books
	mount_uploader :avatar, AvatarUploader

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :correo, 		:presence => true,
							:format => EMAIL_REGEX

end

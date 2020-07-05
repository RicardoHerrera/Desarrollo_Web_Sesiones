class Usuario < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
end

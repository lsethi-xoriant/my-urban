class Avatar < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  crop_uploaded :avatar  ## Add this
  has_one :user
  has_one :event
end

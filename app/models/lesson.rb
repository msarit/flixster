class Lesson < ApplicationRecord
  belongs_to :section
  mount_uploader :video, VideoUploader
end

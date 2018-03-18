class Course < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :sections
  has_many :enrollments
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

end

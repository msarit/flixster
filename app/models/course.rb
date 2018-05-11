class Course < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user
  
  has_many :sections, :dependent => :delete_all
  has_many :enrollments, :dependent => :delete_all
  
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end
end

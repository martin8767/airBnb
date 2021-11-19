class Listing < ApplicationRecord
  belongs_to :user

  has_many :amenitizations, inverse_of: :listing
  has_many :amenities, through: :amenitizations, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations, dependent: :destroy

  accepts_nested_attributes_for :amenitizations, allow_destroy: true
  accepts_nested_attributes_for :categorizations, allow_destroy: true

  has_many_base64_attached :media_files
end

class Amenitization < ApplicationRecord
  belongs_to :listing
  belongs_to :amenity

  accepts_nested_attributes_for :amenity
end

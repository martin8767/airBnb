class Categorization < ApplicationRecord
  belongs_to :listing
  belongs_to :category

  accepts_nested_attributes_for :category
end

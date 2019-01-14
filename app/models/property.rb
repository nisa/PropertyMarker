class Property < ApplicationRecord
  belongs_to :lga
  has_one :address
end
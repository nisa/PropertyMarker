class Address < ApplicationRecord
  belongs_to :lga
  belongs_to :property
end
class V1::PropertySerializer < ActiveModel::Serializer
  attributes :id, :council_property_number, :latitude, :longitude
  has_one :address
  has_one :lga
end

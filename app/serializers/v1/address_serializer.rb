class V1::AddressSerializer < ActiveModel::Serializer
  attributes :full_address, :postcode
  belongs_to :property
end

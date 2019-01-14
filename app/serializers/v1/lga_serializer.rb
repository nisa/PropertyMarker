class V1::LgaSerializer < ActiveModel::Serializer
  attributes :council

  def council
  	object.name
  end
end
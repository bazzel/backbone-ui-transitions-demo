class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :detail_image_url

  attribute :image_url, key: :imageUrl # Shouldn't this be camelCase by default? Maybe by a later version of ActiveModelSerializers
end

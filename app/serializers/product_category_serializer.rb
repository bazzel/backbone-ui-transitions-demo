class ProductCategorySerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :image_url
  attribute :image_url, key: :imageUrl # Shouldn't this be camelCase by default? Maybe by a later version of ActiveModelSerializers
  has_many :products
end

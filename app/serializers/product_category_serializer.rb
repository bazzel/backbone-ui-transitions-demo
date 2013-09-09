class ProductCategorySerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :image_url
  has_many :products
end

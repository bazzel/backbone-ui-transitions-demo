class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :detail_image_url
end

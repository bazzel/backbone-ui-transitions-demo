UiDemo.ProductCategory = DS.Model.extend
  name: DS.attr('string')
  imageUrl: DS.attr('string')
  products: DS.hasMany('product',
    async: yes
  )

UiDemo.ProductCategory = DS.Model.extend
  name: DS.attr('string')
  imageUrl: DS.attr('string')

UiDemo.ProductCategory.reopenClass
  markAsOpen: (model) ->
    @find().forEach (item) ->
      item.set('isOpen', false)
    model.set('isOpen', true)

UiDemo.ProductCategory = DS.Model.extend
  name: DS.attr('string')
  imageUrl: DS.attr('string')
  doClose: ->
    @set('isOpen', false)

UiDemo.ProductCategory.reopenClass
  markAllAsClosed: ->
    @find().forEach (item) ->
      item.doClose()

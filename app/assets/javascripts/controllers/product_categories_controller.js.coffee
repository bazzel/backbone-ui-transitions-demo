UiDemo.ProductCategoriesController = Em.ArrayController.extend
  itemController: 'product_category_item'

  hasActive: (->
    @any((item) ->
      item.get('isOpen') is yes
    )
  ).property('@each.isOpen')

  markAllAsClosed: ->
    @forEach (item) ->
      item.doClose()

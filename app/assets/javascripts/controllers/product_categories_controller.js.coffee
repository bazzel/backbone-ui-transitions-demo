UiDemo.ProductCategoriesController = Em.ArrayController.extend
  itemController: 'product_category_item'

  hasActive: (->
    @any((item) ->
      item.get('isLoaded') is yes
    )
  ).property('@each.isLoaded')

  markAllAsClosed: ->
    @forEach (item) ->
      item.doClose()

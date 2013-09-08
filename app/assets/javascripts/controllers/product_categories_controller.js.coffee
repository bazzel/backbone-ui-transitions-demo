UiDemo.ProductCategoriesController = Em.ArrayController.extend
  itemController: 'product_categories_show'

  hasActive: (->
    @any((item) ->
      item.get('isOpen') is yes
    )
  ).property('@each.isOpen')

  markAllAsClosed: ->
    @forEach (item) ->
      item.doClose()

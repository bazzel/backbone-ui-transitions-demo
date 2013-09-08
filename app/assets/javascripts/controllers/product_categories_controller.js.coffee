UiDemo.ProductCategoriesController = Em.ArrayController.extend
  hasActive: (->
    @any((item) ->
      item.get('isOpen') is yes
    )
  ).property('@each.isOpen')

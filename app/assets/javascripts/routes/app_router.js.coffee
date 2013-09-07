UiDemo.Router.map ->
  @route 'product_categories',
    path: '/'

UiDemo.ProductCategoriesRoute = Em.Route.extend
  model: ->
    UiDemo.ProductCategory.find()

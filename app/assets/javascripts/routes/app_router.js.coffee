UiDemo.Router.map ->
  @resource 'product_categories',
    path: '/'
  , ->
    @route 'show',
      path: 'categories/:product_category_id'

UiDemo.ProductCategoriesRoute = Em.Route.extend
  model: ->
    UiDemo.ProductCategory.find()

UiDemo.ProductCategoriesShowRoute = Em.Route.extend
  setupController: (controller, model) ->
    UiDemo.ProductCategory.markAsOpen(model)

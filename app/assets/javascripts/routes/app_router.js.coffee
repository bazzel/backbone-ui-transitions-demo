UiDemo.Router.map ->
  @resource 'product_categories',
    path: '/'
  , ->
    @route 'show',
      path: 'categories/:product_category_id'

UiDemo.ProductCategoriesRoute = Em.Route.extend
  model: ->
    @store.find('product_category')

UiDemo.ProductCategoriesShowRoute = Em.Route.extend
  setupController: (controller, model) ->
    controller.get('controllers.product_categories').markAllAsClosed()
    controller.set('model', model)
    model.set('isOpen', true)
    model.get('products').then ->
      # Can this help?
      # http://stackoverflow.com/questions/13699796/ember-data-loading-hasmany-association-on-demand
      model.set('productsLoaded', yes)

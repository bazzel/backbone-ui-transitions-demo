UiDemo.Router.map ->
  @resource 'product_categories',
    path: '/'
  , ->
    @route 'show',
      path: 'categories/:product_category_id'

UiDemo.ProductCategoriesRoute = Em.Route.extend
  model: ->
    UiDemo.ProductCategory.find()
  actions:
    toggleOpen: (model) ->
      if isOpen = model.get('isOpen')
        @transitionTo 'product_categories'
      else
        UiDemo.ProductCategory.markAllAsClosed()
        @transitionTo 'product_categories.show', model

      model.set('isOpen', not isOpen)

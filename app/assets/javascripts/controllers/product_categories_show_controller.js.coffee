UiDemo.ProductCategoriesShowController = Em.ObjectController.extend
  needs: ['product_categories']
  actions:
    toggleOpen: ->
      if isOpen = @get('isOpen')
        @transitionToRoute 'product_categories'
      else
        @get('controllers.product_categories').markAllAsClosed()
        @transitionToRoute('product_categories.show', this)

      @set('isOpen', not isOpen)

  doClose: ->
    @set('isOpen', false)

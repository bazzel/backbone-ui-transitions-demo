UiDemo.ProductCategoriesShowController = Em.ObjectController.extend
  needs: ['product_categories']
  actions:
    toggleOpen: ->
      if isOpen = @get 'isOpen'
        @doClose()
        @transitionToRoute 'product_categories'
      else
        @transitionToRoute 'product_categories.show', this

  doClose: ->
    @set 'isOpen', false

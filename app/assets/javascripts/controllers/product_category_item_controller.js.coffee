UiDemo.ProductCategoryItemController = Em.ObjectController.extend
  actions:
    toggleOpen: ->
      if isOpen = @get 'isOpen'
        @doClose()
        @transitionToRoute 'product_categories'
      else
        @transitionToRoute 'product_categories.show', this

  doClose: ->
    @set 'isOpen', false

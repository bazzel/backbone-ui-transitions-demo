UiDemo.ProductCategoriesShowView = Em.View.extend
  didInsertElement: ->
    @_positionFolder()

  didChangeSelectedItem: (->
    @_positionFolder()
  ).observes('selectedItemIndex')

  selectedItemIndex: (->
    pcs = @get('controller.controllers.product_categories.content')
    pc = pcs.find((item) =>
      item.get('id') is @get('controller.id')
    )
    pcs.indexOf(pc)
  ).property('controller.id')

  _positionFolder: ->
    selectedItemIndex = @get('selectedItemIndex')
    parentView = @get('parentView')
    $li = $(parentView.$('li')[selectedItemIndex])
    $li.after @$()


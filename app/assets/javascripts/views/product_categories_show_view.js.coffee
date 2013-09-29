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
    newIndex = @_firstInNextRow(selectedItemIndex)
    # bug 1:
    # Resizing the browser, should reposition the folder
    # Try http://stackoverflow.com/questions/10843362/how-should-i-bind-to-a-window-function-in-an-ember-view
    parentView = @get('parentView')
    $li = $(parentView.$('li.category')[newIndex])
    $li.after @$()

  _colCount: ->
    $parentView = @get('parentView').$()
    $ul = $parentView.find('ul')
    ulWidth = $ul.outerWidth()
    liWidth = $ul.find('li.category').outerWidth(true)
    Math.floor(ulWidth / liWidth)

  _firstInNextRow: (index) ->
    itemCount = @get('controller.controllers.product_categories.content.length')
    firstItemNextRowIndex = @_roundToNearest(index, @_colCount())

    Math.min(itemCount, firstItemNextRowIndex) - 1

  _roundToNearest: (value, n) ->
    Math.floor((value+n)/n)*n


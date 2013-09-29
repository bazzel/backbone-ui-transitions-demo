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
    # No, it's a little more complex than this:
    newIndex = @_firstInNextRow(selectedItemIndex)
    # bug 1:
    # open a category in row 1, then open another in row 2
    # => now, row 2 is missing images which are moved to row 3...
    # bug 2:
    # Resizing the browser, should reposition the folder
    # Try http://stackoverflow.com/questions/10843362/how-should-i-bind-to-a-window-function-in-an-ember-view
    #console.log 'newIndex', newIndex
    parentView = @get('parentView')
    $li = $(parentView.$('li')[newIndex])
    $li.after @$()

  _colCount: ->
    $parentView = @get('parentView').$()
    console.log $parentView.find('li')
    ulWidth = $parentView.find('ul').outerWidth()
    liWidth = $parentView.find('li').outerWidth(true)
    Math.floor(ulWidth / liWidth)

  _firstInNextRow: (index) ->
    colCount = @_colCount()
    itemCount = @get('controller.controllers.product_categories.content.length')
    firstItemNextRowIndex = Math.floor((index+colCount)/colCount)*colCount

    Math.min(itemCount, firstItemNextRowIndex) - 1


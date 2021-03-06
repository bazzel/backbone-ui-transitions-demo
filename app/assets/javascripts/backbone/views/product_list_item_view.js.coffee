
class UIDemo.Views.ProductListItemView extends Backbone.View
  tagName: 'li'
  className: 'product'
  template: JST['product_list_item']

  events:
    'click a': 'openProduct'

  render: ->
    @$el.html @template this
    this

  url: ->
    "/categories/#{@model.collection.categoryId}/products/#{@model.id}"

  imageUrl: ->
    @model.get('imageUrl')

  open: ->
    # ensure existence of detailView
    @detailView ?= new UIDemo.Views.ProductDetailView
       model: @model
    $('body').append @detailView.render().el

    # submit the 'a' instead of the img.
    # this way we rotate the entire link and can provide a custom backface to the image.
    # see: http://desandro.github.io/3dtransforms/docs/card-flip.html
    @detailView.open(@$('a')).then =>
      @detailView
    #   @model.loadDetails().then =>
    #     @detailView

  isOpen: ->
    @$('img:first').is('.opened')

  close: ->
    return `when`.resolve() unless @detailView?

    @detailView.close(@$('a')).then =>
      @detailView.remove()
      delete @['detailView']

  openProduct: (event) ->
    event.preventDefault()
    if @isOpen()
      @close().then =>
        Backbone.history.navigate "/categories/#{@model.collection.categoryId}"
    else
      @open().then =>
        Backbone.history.navigate @url()
    false

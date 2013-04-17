
class UIDemo.Views.TransitionView extends Backbone.View

  transitionRemoveClass: (className, $el = @$el) ->
    p = @_transitionPromise($el)
    @_delay ->
      p.start()
      $el.removeClass className
    .then ->
      p.promise

  transitionAddClass: (className, $el = @$el) ->
    p = @_transitionPromise($el)
    @_delay ->
      p.start()
      $el.addClass className
    .then ->
      p.promise

  _transitionPromise: ($el) ->
    defer = `when`.defer()
    transition =
      duration: @_getTransitionDuration($el)
      eventName: @_whichTransitionEvent()
      resolver: defer.resolver
      el: $el[0]
      view: this
      handler: ->
        clearTimeout(@timeout)
        @el.removeEventListener(@eventName, @handler, false)
        @resolver.resolve(this)
      start: ->
        return @resolver.resolve(this) if $('body').is('.no-transitions')
        @timeout = setTimeout(
          @handler
          @duration
        )
        @el.addEventListener(@eventName, @handler, false)
      promise: defer.promise
    _.bindAll(transition)

    transition

  _getTransitionDuration: ($el) ->
    duration = @_parseTime $el.css('transitionDuration')
    delay = @_parseTime $el.css('transitionDelay')
    (duration + delay) * 1000

  _parseTime: (text) ->
    Math.max (parseFloat(item) for item in text.split(', '))...

  _whichTransitionEvent: ->
    el = document.createElement('fakeelement')
    transitions =
      'transition': 'transitionend'
      'OTransition': 'oTransitionEnd'
      'MozTransition': 'transitionend'
      'WebkitTransition': 'webkitTransitionEnd'
    return event for property, event of transitions when el.style[property]?

  _delay: (code, time = 0) ->
    if $('body').is('.no-transitions')
      result = code()
      `when`.resolve(result)

    defer = `when`.defer()
    setTimeout(
      -> `when(code())`.then (result) => defer.resolve(result)
      time
    )
    defer.promise

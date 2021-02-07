class Dashing.Clock extends Dashing.Widget

  ready: ->
    setInterval(@startTime, 500)

  startTime: =>
    today = new Date()

    h = @formatTime(@formatHours(today.getHours()))
    m = today.getMinutes()
    s = today.getSeconds()
    m = @formatTime(m)
    s = @formatTime(s)
    @set('time', h + ":" + m + ":" + s)
    @set('date', today.toDateString())
    @set('half', @getHalf(today.getHours()))

  formatTime: (i) ->
    if i < 10 then "0" + i else i

  formatHours: (i) ->
    if i == 0 || i == 12 then 12 else i %% 12

  getHalf: (i) ->
    if i > 11 then "PM" else "AM"
#= require keyboard
class Pong.Controller
  constructor: (upKey, downKey) ->
    @upKey = upKey
    @downKey = downKey

  update: =>
    keys = KeyboardJS.activeKeys()
    @up = keys.indexOf(@upKey) > -1
    @down = keys.indexOf(@downKey) > -1



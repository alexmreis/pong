class Pong.Ball
  constructor: (game) ->
    @game = game

  init: =>
    @w = (@game.gfxEngine.screenBounds.width / 20) / 2
    @h = @w
    @x = @game.gfxEngine.centerHorizontally(@w)
    @y = @game.gfxEngine.centerVertically(@h)

  throw: =>
    @angle = Math.floor(Math.random() * 360)
    @speed = @game.gfxEngine.screenBounds.width / 100

  update: =>
    @x += @speed * Math.cos(@angle)
    @y += @speed * Math.sin(@angle)

  collide: =>
    @angle = @angle * -1

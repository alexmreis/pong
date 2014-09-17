class Pong.Paddle
  constructor: (game, side) ->
    @game = game
    @side = side

  init: =>
    @x = @game.gfxEngine.screenBounds[@side]
    if @side == 'left'
      @x += @game.gfxEngine.screenBounds.width / 30
    else
      @x -= (@game.gfxEngine.screenBounds.width / 30) * 2

    @w = @game.gfxEngine.screenBounds.width / 30
    @h = @game.gfxEngine.screenBounds.height / 3

    @y = @game.gfxEngine.centerVertically(@h)

  readInput: (source) =>
    if source.up
      @y -= 10

    if source.down
      @y += 10

    @y = Math.min(@y, @game.gfxEngine.screenBounds.height - @h)
    @y = Math.max(@y, 0)

  update: =>

  step: =>
    Math.floor(@h / 4)


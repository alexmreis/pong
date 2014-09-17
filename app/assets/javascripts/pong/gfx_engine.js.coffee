class Pong.GfxEngine
  constructor: (game) ->
    @game = game

  init: =>
    @screenBounds =
      width: window.innerWidth
      height: window.innerHeight
      left: 0
      right: window.innerWidth

    @canvas = $('<canvas id="game-canvas"></canvas>')[0]
    $('body').append(@canvas)

  render: =>
    @screenBounds = 
      width: window.innerWidth
      height: window.innerHeight
      left: 0
      right: window.innerWidth

    @canvas.height = @screenBounds.height
    @canvas.width = @screenBounds.width

    ctx = @canvas.getContext('2d')
    @drawBackground(ctx)
    @drawRectangle(ctx, @game.paddle1)
    @drawRectangle(ctx, @game.paddle2)
    @drawRectangle(ctx, @game.ball)

  drawBackground: (ctx) =>
    ctx.beginPath()
    ctx.rect(0, 0, @screenBounds.width, @screenBounds.height)
    ctx.fillStyle = "black"
    ctx.fill()

  drawRectangle: (ctx, thing) =>
    ctx.beginPath()
    ctx.rect(thing.x, thing.y, Math.floor(thing.w), Math.floor(thing.h))
    ctx.fillStyle = "white"
    ctx.fill()

  centerHorizontally: (width) =>
    (@screenBounds.width / 2) - (width / 2)

  centerVertically: (height) =>
    (@screenBounds.height / 2) - (height / 2)


#= require 'pong/gfx_engine'
#= require 'pong/ball'
#= require 'pong/paddle'
#= require 'pong/controller'
class Pong.Game

  init: =>
    @gfxEngine = new Pong.GfxEngine(this)
    @gfxEngine.init()

  start: =>
    @resetScores()
    @initializePaddles()
    @initializeControllers()
    @throwBall()
    @nextLoop()

  mainLoop: =>
    @controller1.update()
    @controller2.update()

    @paddle1.readInput(@controller1)
    @paddle2.readInput(@controller2)

    @ball.update()
    @checkCollisions()

    @gfxEngine.render()
    @nextLoop()

  resetScores: =>
    @score = [0,0]

  initializePaddles: =>
    @paddle1 = new Pong.Paddle(this, 'left')
    @paddle2 = new Pong.Paddle(this, 'right')

    @paddle1.init()
    @paddle2.init()

  initializeControllers: =>
    @controller1 = new Pong.Controller('w', 's')
    @controller2 = new Pong.Controller('up', 'down')

  throwBall: =>
    @ball = new Pong.Ball(this, 'center')
    @ball.init()
    @ball.throw()

  nextLoop: =>
    window.requestAnimationFrame(@mainLoop)

  checkCollisions: =>
    for paddle in [@paddle1, @paddle2]

      if @withinRectangle(@ball, paddle)
        @ball.angle += 180

    if @ball.y > @gfxEngine.screenBounds.height || @ball.y <= 0
      @ball.collide()

    if @ball.x <= 0
      @score[0] += 1
      @throwBall()

    if @ball.x >= @gfxEngine.screenBounds.width
      @score[1] += 1
      @throwBall()

  withinRectangle: (thing, rectangle) ->
    if thing.x + thing.w >= rectangle.x  and thing.x <= (rectangle.x + rectangle.w) and thing.y + thing.h >= rectangle.y and thing.y <= (rectangle.y + rectangle.h)
      return true
    false



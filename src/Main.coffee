#= require Splash
#= require Landscape

LaggyDash = window.LaggyDash

Splash = LaggyDash.Splash
Landscape = LaggyDash.Landscape

class Main extends Phaser.State
  constructor:(@parent='')->

  run:(debug = false)->
    mode = if debug then Phaser.CANVAS else Phaser.AUTO
    new Phaser.Game(896, 504, mode, @parent, this)

  preload:->  
    @game.stage.scaleMode = Phaser.StageScaleMode.EXACT_FIT
    @game.stage.scale.setShowAll()
    @game.stage.scale.refresh()
    @game.load.onLoadComplete.addOnce(@ready)
    @game.state.add('splash', new Splash(), false)
    @game.state.add('landscape', new Landscape(), false)
    @game.load.image('labs', 'assets/labs.png')
    @game.load.image('sky', 'assets/sky.jpg')
    @game.load.image('sun', 'assets/sun.png')
    @game.load.image('cloud', 'assets/cloud.png')
    @game.load.image('mountain', 'assets/mountain.png')
    @game.load.image('grass', 'assets/grass.png')
    @game.load.image('tree1', 'assets/tree1.png')
    @game.load.image('tree2', 'assets/tree2.png')

  loadUpdate:->
    console.debug(@game.load.progress)

  loadRender:->
    @game.debug.renderText('LOADING...', 20, 20, "#FFFFFF")

  render:->
    @game.debug.renderText('CLICK!', 20, 20, "#FFFFFF")

  ready:=>
    @game.state.start('splash')

LaggyDash.Main = Main

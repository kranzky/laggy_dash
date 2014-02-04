#= require Splash

LaggyDash = window.LaggyDash

Splash = LaggyDash.Splash

class Main extends Phaser.State
  constructor:(@parent='')->

  boot:(debug = false)->
    mode = if debug then Phaser.CANVAS else Phaser.AUTO
    new Phaser.Game(896, 504, mode, @parent, this, false, false)

  create:->
    @game.stage.backgroundColor = '#000000'

  destroy:->

  preload:->  
    @game.load.onLoadComplete.addOnce(@ready)
    @game.state.add('splash', new Splash(), false)
    @game.load.image('labs', 'assets/labs.png')

  loadUpdate:->
    console.debug(@game.load.progress)

  loadRender:->
    @game.debug.renderText('LOADING...', 20, 20, "#FFFFFF")

  ready:=>
    @game.state.start('splash')

LaggyDash.Main = Main

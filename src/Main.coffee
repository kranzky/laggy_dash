LaggyDash = window.LaggyDash

class Main extends Phaser.State
  constructor:(@parent='')->

  boot:(debug = false)->
    mode = if debug then Phaser.CANVAS else Phaser.AUTO
    new Phaser.Game(896, 504, mode, @parent, this, false, false)

  create:->
    @game.stage.backgroundColor = '#000000';

  preload:->  
    @game.load.onLoadComplete.add @ready
    @game.load.image('labs', 'assets/labs.png')

  loadUpdate:->
    console.log(@game.load.progress)

  loadRender:->
    @game.debug.renderText('LOADING...', 20, 20, "#FFFFFF")

  ready:->
    console.log("DONE")

LaggyDash.Main = Main

LaggyDash = window.LaggyDash

class Landscape extends Phaser.State
  SPEED = 1

  constructor:->

  create:->
    @game.stage.backgroundColor = '#000055'

    @player_name = location.search.replace(/[^a-z0-9_]/i, '')
    console.log(@player_name)

    @night = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'night')
    @night.alpha = 0
    @night.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@night)
    fade.to({ alpha: 1 }, 300000 / SPEED, Phaser.Easing.Linear.None, true, 150000 / SPEED, 999, true)
    fade.start

    @sky = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'sky')
    @sky.alpha = 1
    @sky.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@sky)
    fade.to({ alpha: 0 }, 450000 / SPEED, Phaser.Easing.Linear.None, true, 0, 999, true)
    fade.start

    @sun = @game.add.sprite(0, 0, 'sun')
    @sun.anchor.setTo(0.5, 0.5)
    @sun.scale.setTo(0.3, 0.4)
    @sun.x = @game.world.centerX
    @sun.y = @game.world.centerY * 0.5 - 100

    grow = @game.add.tween(@sun.scale)
    grow.to({ x: 1.5, y: 1.5 }, 450000 / SPEED, Phaser.Easing.Cubic.InOut, true, 0, 999, true)
    grow.start

    set = @game.add.tween(@sun)
    set.to({ y: 675 }, 450000 / SPEED, Phaser.Easing.Sinusoidal.InOut, true, 0, 999, true)
    set.start

    fade = @game.add.tween(@sun)
    fade.to({ alpha: 0 }, 450000 / SPEED, Phaser.Easing.Linear.None, true, 0, true, true)
    fade.start

    @cloud = @game.add.sprite(1000, 70, 'cloud')
    @cloud.alpha = 0.4
    move = @game.add.tween(@cloud)
    move.to({x: -800}, 300000 / SPEED, Phaser.Easing.Linear.None, true, 0, 999)
    move.start

    @mountain0a = @game.add.sprite(0, 180, 'mountain0')
    @mountain0b = @game.add.sprite(2000, 180, 'mountain0')

    @mountain1a = @game.add.sprite(0, 180, 'mountain1')
    @mountain1b = @game.add.sprite(2000, 180, 'mountain1')

    @guy = @game.add.sprite(600, 350, 'guy')
    @guy.scale.setTo(0.25, 0.25)
    @guy.anchor.setTo(0.5, 1.0)

    @mountain2a = @game.add.sprite(0, 180, 'mountain2')
    @mountain2b = @game.add.sprite(2000, 180, 'mountain2')
    @mountain2a.alpha = 0.9
    @mountain2b.alpha = 0.9

    @mountain3a = @game.add.sprite(0, 180, 'mountain3')
    @mountain3b = @game.add.sprite(2000, 180, 'mountain3')
    @mountain3a.alpha = 0.4
    @mountain3b.alpha = 0.4

    @tree0 = @game.add.sprite(2000, 490, 'tree0')
    @tree0.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree0)
    move.to({x: -2000}, 3400 / SPEED, Phaser.Easing.Linear.None, true, 3000 / SPEED, 999)
    move.start

    @tree1 = @game.add.sprite(2000, 490, 'tree1')
    @tree1.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree1)
    move.to({x: -2000}, 3500 / SPEED, Phaser.Easing.Linear.None, true, 7000 / SPEED, 999)
    move.start

    @tree2 = @game.add.sprite(2000, 490, 'tree2')
    @tree2.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree2)
    move.to({x: -2000}, 3600 / SPEED, Phaser.Easing.Linear.None, true, 13000 / SPEED, 999)
    move.start

    @tree3 = @game.add.sprite(2000, 490, 'tree3')
    @tree3.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree3)
    move.to({x: -2000}, 3400 / SPEED, Phaser.Easing.Linear.None, true, 17000 / SPEED, 999)
    move.start

    @grass1 = @game.add.sprite(0, 380, 'grass')
    @grass2 = @game.add.sprite(896, 380, 'grass')

    player = @game.add.sprite(600, 475, 'player')
    player.scale.setTo(0.8, 0.8)
    player.anchor.setTo(0.5, 1.0)
    player.alpha = 0.7

    @position = 0

    @pen = @game.add.graphics(0, 0)
    @pen.lineStyle(3, 0xffd900, 0.5)
    @pen.moveTo(600, 410)
    @pen.lineTo(600, 355)

    style =
      font: "10pt Courier"
      fill: "#ffffff"

    @label = @game.add.text(600, 480, "@#{@game.player_name}", style)
    @label.x -= @label.width / 2

    window.laggydash.send("join")

  update:->
    @position += 1

    @grass1.x -= 20 * SPEED
    @grass2.x -= 20 * SPEED
    @grass1.x += 896 * 2 if @grass1.x <= -896
    @grass2.x += 896 * 2 if @grass2.x <= -896

    @mountain0a.x -= 0.3 * SPEED
    @mountain0b.x -= 0.3 * SPEED
    @mountain0a.x += 2000 * 2 if @mountain0a.x <= -2000
    @mountain0b.x += 2000 * 2 if @mountain0b.x <= -2000

    @mountain1a.x -= 0.6 * SPEED
    @mountain1b.x -= 0.6 * SPEED
    @mountain1a.x += 2000 * 2 if @mountain1a.x <= -2000
    @mountain1b.x += 2000 * 2 if @mountain1b.x <= -2000

    @mountain2a.x -= 0.9 * SPEED
    @mountain2b.x -= 0.9 * SPEED
    @mountain2a.x += 2000 * 2 if @mountain2a.x <= -2000
    @mountain2b.x += 2000 * 2 if @mountain2b.x <= -2000

    @mountain3a.x -= 1.2 * SPEED
    @mountain3b.x -= 1.2 * SPEED
    @mountain3a.x += 2000 * 2 if @mountain3a.x <= -2000
    @mountain3b.x += 2000 * 2 if @mountain3b.x <= -2000

    if @position % 9 == 0
      @guy.frame = (@guy.frame + 1) % 6

  destroy:->
    destroy(@tree0)
    destroy(@tree1)
    destroy(@tree2)
    destroy(@tree3)
    destroy(@night)
    destroy(@sky)
    destroy(@sun)
    destroy(@cloud)
    destroy(@grass1)
    destroy(@grass2)
    destroy(@guy)

  done:=>
    @game.state.start('splash')

LaggyDash.Landscape = Landscape

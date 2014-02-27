LaggyDash = window.LaggyDash

class Landscape extends Phaser.State
  SPEED = 1

  constructor:->

  create:->
    @game.stage.backgroundColor = '#000055'

    @night = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'night')
    @night.alpha = 0
    @night.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@night)
    fade.to({ alpha: 1 }, 300000 / SPEED, Phaser.Easing.Linear.None, true, 200000 / SPEED)
    fade.start

    @sky = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'sky')
    @sky.alpha = 1
    @sky.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@sky)
    fade.to({ alpha: 0 }, 500000 / SPEED, Phaser.Easing.Linear.None, true)
    fade.start

    @sun = @game.add.sprite(0, 0, 'sun')
    @sun.anchor.setTo(0.5, 0.5)
    @sun.scale.setTo(0.3, 0.4)
    @sun.x = @game.world.centerX
    @sun.y = @game.world.centerY * 0.5 - 100

    grow = @game.add.tween(@sun.scale)
    grow.to({ x: 5, y: 3 }, 1200000 / SPEED, Phaser.Easing.Linear.None, true)
    grow.start

    set = @game.add.tween(@sun)
    set.to({ y: 450 }, 300000 / SPEED, Phaser.Easing.Quintic.None, true)
    set.start

    fade = @game.add.tween(@sun)
    fade.to({ alpha: 0 }, 400000 / SPEED, Phaser.Easing.Linear.None, true)
    fade.start

    @cloud = @game.add.sprite(1000, 10, 'cloud')
    @cloud.alpha = 0.4
    move = @game.add.tween(@cloud)
    move.to({x: -800}, 300000 / SPEED, Phaser.Easing.Linear.None, true, 0, 1)
    move.start

    @mountain0a = @game.add.sprite(0, 180, 'mountain0')
    @mountain0b = @game.add.sprite(2000, 180, 'mountain0')

    @mountain1a = @game.add.sprite(0, 180, 'mountain1')
    @mountain1b = @game.add.sprite(2000, 180, 'mountain1')

    @mountain2a = @game.add.sprite(0, 180, 'mountain2')
    @mountain2b = @game.add.sprite(2000, 180, 'mountain2')

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

    @guy = @game.add.sprite(600, 330, 'guy')
    @guy.scale.setTo(0.25, 0.25)

    @grass1 = @game.add.sprite(0, 380, 'grass')
    @grass2 = @game.add.sprite(896, 380, 'grass')

    @position = 0

    @game.add.sprite(100, 100, 'foo')

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

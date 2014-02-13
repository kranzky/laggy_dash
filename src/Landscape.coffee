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
    fade.to({ alpha: 1 }, 400000 / SPEED, Phaser.Easing.Linear.None, true, 400000 / SPEED)
    fade.start

    @sky = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'sky')
    @sky.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@sky)
    fade.to({ alpha: 0 }, 700000 / SPEED, Phaser.Easing.Linear.None, true)
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
    fade.to({ alpha: 0 }, 500000 / SPEED, Phaser.Easing.Linear.None, true)
    fade.start

    @cloud = @game.add.sprite(1000, 10, 'cloud')
    @cloud.alpha = 0.4
    move = @game.add.tween(@cloud)
    move.to({x: -800}, 300000 / SPEED, Phaser.Easing.Linear.None, true, 0, 1)
    move.start

    @mountain1 = @game.add.sprite(0, 220, 'mountain')
    @mountain2 = @game.add.sprite(2000, 220, 'mountain')

    @tree1 = @game.add.sprite(2000, 520, 'tree1')
    @tree1.anchor.setTo(0.5, 1)
    @tree1.scale.setTo(4, 4)
    move = @game.add.tween(@tree1)
    move.to({x: -2000}, 1900 / SPEED, Phaser.Easing.Linear.None, true, 7000 / SPEED, 999)
    move.start

    @tree2 = @game.add.sprite(2000, 520, 'tree2')
    @tree2.anchor.setTo(0.5, 1)
    @tree2.scale.setTo(4, 4)
    move = @game.add.tween(@tree2)
    move.to({x: -2000}, 1700 / SPEED, Phaser.Easing.Linear.None, true, 13000 / SPEED, 999)
    move.start

    @guy = @game.add.sprite(500, 395, 'guy')

    @grass1 = @game.add.sprite(0, 380, 'grass')
    @grass2 = @game.add.sprite(896, 380, 'grass')

    @position = 0

  update:->
    @position += 1

    @grass1.x -= 20 * SPEED
    @grass2.x -= 20 * SPEED
    @grass1.x += 896 * 2 if @grass1.x <= -896
    @grass2.x += 896 * 2 if @grass2.x <= -896

    @mountain1.x -= 0.5 * SPEED
    @mountain2.x -= 0.5 * SPEED
    @mountain1.x += 2000 * 2 if @mountain1.x <= -2000
    @mountain2.x += 2000 * 2 if @mountain2.x <= -2000

    if @position % 3 == 0
      @guy.frame += 1
      @guy.frame = 0 if @guy.frame == 5

  destroy:->
    destroy(@night)
    destroy(@sky)
    destroy(@sun)
    destroy(@cloud)
    destroy(@grass1)
    destroy(@grass2)

  done:=>
    @game.state.start('splash')

LaggyDash.Landscape = Landscape

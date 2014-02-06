LaggyDash = window.LaggyDash

class Landscape extends Phaser.State
  constructor:->

  create:->
    @game.stage.backgroundColor = '#000000'

    @sky = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'sky')
    @sky.anchor.setTo(0.5, 0.5)

    @sun = @game.add.sprite(0, 0, 'sun')
    @sun.anchor.setTo(0.5, 0.5)
    @sun.scale.setTo(0.4, 0.4)
    @sun.x = @game.world.centerX
    @sun.y = @game.world.centerY * 0.5

    grow = @game.add.tween(@sun.scale)
    grow.to({ x: 5, y: 3 }, 1200000, Phaser.Easing.Linear.None, true)
    grow.start

    set = @game.add.tween(@sun)
    set.to({ y: 450 }, 300000, Phaser.Easing.Quintic.None, true)
    set.start

    @cloud = @game.add.sprite(1000, 100, 'cloud')
    move = @game.add.tween(@cloud)
    move.to({x: -200}, 100000, Phaser.Easing.Linear.None, true, 0, 1000)
    move.start

    @mountain1 = @game.add.sprite(0, 240, 'mountain')
    @mountain2 = @game.add.sprite(2000, 240, 'mountain')

    @tree1 = @game.add.sprite(2000, 520, 'tree1')
    @tree1.anchor.setTo(0.5, 1)
    @tree1.scale.setTo(4, 4)
    move = @game.add.tween(@tree1)
    move.to({x: -2000}, 1900, Phaser.Easing.Linear.None, true, 7000, 1000)
    move.start

    @tree2 = @game.add.sprite(2000, 520, 'tree2')
    @tree2.anchor.setTo(0.5, 1)
    @tree2.scale.setTo(4, 4)
    move = @game.add.tween(@tree2)
    move.to({x: -2000}, 1700, Phaser.Easing.Linear.None, true, 13000, 1000)
    move.start

    @grass1 = @game.add.sprite(0, 320, 'grass')
    @grass2 = @game.add.sprite(896, 320, 'grass')

  update:->
    @grass1.x -= 20
    @grass2.x -= 20
    @grass1.x += 896 * 2 if @grass1.x <= -896
    @grass2.x += 896 * 2 if @grass2.x <= -896

    @mountain1.x -= 0.5
    @mountain2.x -= 0.5
    @mountain1.x += 2000 * 2 if @mountain1.x <= -2000
    @mountain2.x += 2000 * 2 if @mountain2.x <= -2000

  destroy:->
    destroy(@sky)
    destroy(@sun)
    destroy(@cloud)
    destroy(@grass1)
    destroy(@grass2)

  done:=>
    @game.state.start('splash')

LaggyDash.Landscape = Landscape
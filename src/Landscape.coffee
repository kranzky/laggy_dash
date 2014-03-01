LaggyDash = window.LaggyDash

class Landscape extends Phaser.State
  SPEED = 1

  constructor:->

  preload:->
    window.laggydash.connect('laggydash', laggydash.game.rnd.uuid() + ":#{@game.player_name}")

  create:->
    @game.stage.backgroundColor = '#000055'

    @night = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'night')
    @night.body = null
    @night.alpha = 0
    @night.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@night)
    fade.to({ alpha: 1 }, 300000 / SPEED, Phaser.Easing.Linear.None, true, 150000 / SPEED, 999, true)
    fade.start

    @sky = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'sky')
    @sky.body = null
    @sky.alpha = 1
    @sky.anchor.setTo(0.5, 0.5)

    fade = @game.add.tween(@sky)
    fade.to({ alpha: 0 }, 450000 / SPEED, Phaser.Easing.Linear.None, true, 0, 999, true)
    fade.start

    @sun = @game.add.sprite(0, 0, 'sun')
    @sun.body = null
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
    @cloud.body = null
    @cloud.alpha = 0.4
    move = @game.add.tween(@cloud)
    move.to({x: -800}, 70000 / SPEED, Phaser.Easing.Linear.None, true, 0, 999)
    move.start

    @mountain0a = @game.add.sprite(0, 180, 'mountain0')
    @mountain0a.body = null
    @mountain0b = @game.add.sprite(2000, 180, 'mountain0')
    @mountain0b.body = null

    @player_group = @game.add.group()

    @coin = @game.add.sprite(400, 250, 'coin')
    @coin.body = null
    @coin.anchor.setTo(0.5, 0.5)
    @coin.animations.add('spin', [0, 1, 2, 3, 4, 5], 10, true)
    @coin.animations.play('spin')

    @bomb = @game.add.sprite(450, 250, 'bomb')
    @bomb.body = null
    @bomb.anchor.setTo(0.5, 0.5)
    @bomb.animations.add('pulse', [0, 1, 2, 3, 4, 5], 10, true)
    @bomb.animations.play('pulse')

    @mountain1a = @game.add.sprite(0, 180, 'mountain1')
    @mountain1a.body = null
    @mountain1b = @game.add.sprite(2000, 180, 'mountain1')
    @mountain1b.body = null

    @heightmap = []
    y = 122
    for x in [0..@mountain1a.width]
      solid = @mountain1a.input.checkPixel(x, y)
      if solid
        while solid
          y -= 1
          solid = @mountain1a.input.checkPixel(x, y)
        y += 1
      else
        until solid
          y += 1
          solid = @mountain1a.input.checkPixel(x, y)
          break if y > 200
      @heightmap.push(y)

    @mountain2a = @game.add.sprite(0, 180, 'mountain2')
    @mountain2a.body = null
    @mountain2b = @game.add.sprite(2000, 180, 'mountain2')
    @mountain2b.body = null

    @mountain3a = @game.add.sprite(0, 180, 'mountain3')
    @mountain3a.body = null
    @mountain3a.alpha = 0.4
    @mountain3b = @game.add.sprite(2000, 180, 'mountain3')
    @mountain3b.body = null
    @mountain3b.alpha = 0.4

    @avatar_group = @game.add.group()

    @explosion = @game.add.sprite(500, 250, 'explosion')
    @explosion.anchor.setTo(0.5, 0.5)
    @explosion.animations.add('bang', [0, 1, 2, 3], 4, false)
    @explosion.animations.play('bang', 4, false, true)

    @tree0 = @game.add.sprite(2000, 490, 'tree0')
    @tree0.body = null
    @tree0.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree0)
    move.to({x: -2000}, 3400 / SPEED, Phaser.Easing.Linear.None, true, 3000 / SPEED, 999)
    move.start

    @tree1 = @game.add.sprite(2000, 490, 'tree1')
    @tree1.body = null
    @tree1.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree1)
    move.to({x: -2000}, 3500 / SPEED, Phaser.Easing.Linear.None, true, 7000 / SPEED, 999)
    move.start

    @tree2 = @game.add.sprite(2000, 490, 'tree2')
    @tree2.body = null
    @tree2.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree2)
    move.to({x: -2000}, 3600 / SPEED, Phaser.Easing.Linear.None, true, 13000 / SPEED, 999)
    move.start

    @tree3 = @game.add.sprite(2000, 490, 'tree3')
    @tree3.body = null
    @tree3.anchor.setTo(0.5, 1)
    move = @game.add.tween(@tree3)
    move.to({x: -2000}, 3400 / SPEED, Phaser.Easing.Linear.None, true, 17000 / SPEED, 999)
    move.start

    @grass1 = @game.add.sprite(0, 380, 'grass')
    @grass1.body = null
    @grass2 = @game.add.sprite(896, 380, 'grass')
    @grass2.body = null

    @label_group = @game.add.group()

    @position = 0
    @players = {}
    @addPlayer(window.laggydash.user.replace(/:.*$/, ''), @game.player_name, true)

    key = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)
    key.onDown.add(@jump)
    @game.input.onTap.add(@jump)

    @current = null
    @timer = @game.time.create()
    @timer.start()

  update:->
    @position += 1

    @grass1.x -= 20 * SPEED
    @grass2.x -= 20 * SPEED
    @grass1.x += 896 * 2 if @grass1.x <= -896
    @grass2.x += 896 * 2 if @grass2.x <= -896

    @mountain0a.x -= 1.1 * SPEED
    @mountain0b.x -= 1.1 * SPEED
    @mountain0a.x += 2000 * 2 if @mountain0a.x <= -2000
    @mountain0b.x += 2000 * 2 if @mountain0b.x <= -2000

    @mountain1a.x -= 1.7 * SPEED
    @mountain1b.x -= 1.7 * SPEED
    @mountain1a.x += 2000 * 2 if @mountain1a.x <= -2000
    @mountain1b.x += 2000 * 2 if @mountain1b.x <= -2000

    @mountain2a.x -= 2.3 * SPEED
    @mountain2b.x -= 2.3 * SPEED
    @mountain2a.x += 2000 * 2 if @mountain2a.x <= -2000
    @mountain2b.x += 2000 * 2 if @mountain2b.x <= -2000

    @mountain3a.x -= 2.9 * SPEED
    @mountain3b.x -= 2.9 * SPEED
    @mountain3a.x += 2000 * 2 if @mountain3a.x <= -2000
    @mountain3b.x += 2000 * 2 if @mountain3b.x <= -2000

    min = Math.round(Math.min(@mountain1a.x, @mountain1b.x))
    @player_group.forEachAlive (player) =>
      x = (player.x - min) % 2000
      y = @heightmap[Math.round(x)] + @mountain1a.y
      wasOnGround = player.onGround
      delta = player.y - y
      player.onGround = delta > 0
      player.jump = false if delta < -20
      if player.onGround
        player.y = y
        player.body.velocity.y = 0
        if player.jump
          player.jump = false
          player.onGround = false
          player.y -= 10
          player.body.velocity.y = -200
          player.animations.stop()
          player.frame = if player.key == 'runner' then 4 else 2
      if !wasOnGround && player.onGround
        player.play('run')
      if player.key == 'wolf' && player.x == player.target && player.onGround
        player.target = @game.rnd.integerInRange(100, 500)
        move = @game.add.tween(player)
        move.to({x: player.target}, @game.rnd.realInRange(3000, 8000), Phaser.Easing.Sinusoidal.InOut, false, @game.rnd.realInRange(0, 10000))
        move.start()

    if @current?
      player = @players[@current]
      player.avatar.x = player.runner.x
      player.label.x = player.runner.x - player.label.width / 2

    if @prev?
      player = @players[@prev]
      player.avatar.x = player.runner.x
      player.label.x = player.runner.x - player.label.width / 2

  jump:=>
    @player_group.forEachAlive (player) =>
      if player.key == 'runner'
        player.jump = true
        window.laggydash.send({ action: 'jump' })
    
  addPlayer:(id, name, isPlayer=false)->
    x = if isPlayer then 600 else @game.rnd.integerInRange(100, 500)
    s = if isPlayer then 'runner' else 'wolf'
    f = if isPlayer then 8 else 12
    o = if isPlayer then 0.9 else 1.0

    runner = @game.add.sprite(x, 0, s)
    runner.animations.add('run', [0, 1, 2, 3, 4, 5], f, true)
    runner.anchor.setTo(0.5, o)
    runner.onGround = false
    runner.jump = false
    runner.frame = if isPlayer then 3 else 4
    runner.target = x
    runner.id = id

    @player_group.add(runner)

    avatar = @game.add.sprite(x, 475, "@#{name}")
    avatar.body = null
    avatar.id = id
    avatar.name = name
    avatar.width = 60
    avatar.height = 60
    avatar.anchor.setTo(0.5, 1.0)
    avatar.alpha = 0.0
    avatar.inputEnabled = true
    avatar.useHandCursor = true
    avatar.events.onInputDown.add =>
      if avatar.alpha > 0.5
        window.laggydash.showUser(name)

    @avatar_group.add(avatar)

    style =
      font: "10pt Courier"
      fill: "#ffffff"

    label = @game.add.text(x, 480, "@#{name}", style)
    label.x -= label.width / 2
    label.alpha = 0.0

    @label_group.add(label)

    if isPlayer
      fade = @game.add.tween(avatar)
      fade.to({ alpha: 0.8 }, 1000, Phaser.Easing.Linear.None, true, 2000)
      fade.start
      fade = @game.add.tween(label)
      fade.to({ alpha: 1.0 }, 1000, Phaser.Easing.Linear.None, true, 2000)
      fade.start
    else
      @players[id] =
        runner: runner
        avatar: avatar
        label: label

  showPlayer:=>
    ids = _.keys(@players)
    if @current? && ids.length > 1
      @prev = @current
      ids = _.without(ids, @current)
      player = @players[@current]
      fade = @game.add.tween(player.avatar)
      fade.to({ alpha: 0.0 }, 1000, Phaser.Easing.Linear.None, true)
      fade.start
      fade = @game.add.tween(player.label)
      fade.to({ alpha: 0.0 }, 1000, Phaser.Easing.Linear.None, true)
      fade.start
    @current = @game.rnd.pick(ids)
    player = @players[@current]
    fade = @game.add.tween(player.avatar)
    fade.to({ alpha: 0.8 }, 1000, Phaser.Easing.Linear.None, true, 500)
    fade.start
    fade = @game.add.tween(player.label)
    fade.to({ alpha: 1.0 }, 1000, Phaser.Easing.Linear.None, true, 500)
    fade.start
    @timer.remove(event) for event in @timer.events
    @timer.add(8000, @showPlayer)

  delPlayer:(id)->
    return unless @players[id]?
    @players[id].runner.destroy()
    @players[id].avatar.destroy()
    @players[id].label.destroy()
    delete(@players[id])
    if @current == id
      @current = null 
      @showPlayer()
    @prev = null if @prev == id

  avatarLoaded:(key)->
    @avatar_group.forEach (avatar)=>
      if avatar.key == "__missing" && key == "@#{avatar.name}"
        avatar.loadTexture(key)
        avatar.width = 60
        avatar.height = 60

  handle:(remote)->
    switch remote.action
      when 'join'
        @addPlayer(remote.id, remote.name)
        @showPlayer() if @current == null
      when 'bail'
        @delPlayer(remote.id)
      when 'jump'
        @player_group.forEachAlive (player) =>
          player.jump = true if player.id == remote.id

  delMob:(id, name)->
    console.log("ADD #{name}")

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
    destroy(@runner)

  done:=>
    @game.state.start('splash')

LaggyDash.Landscape = Landscape

(function(){window.LaggyDash={}}).call(this),function(){var e,t,a=function(e,t){return function(){return e.apply(t,arguments)}},i={}.hasOwnProperty,n=function(e,t){function a(){this.constructor=e}for(var n in t)i.call(t,n)&&(e[n]=t[n]);return a.prototype=t.prototype,e.prototype=new a,e.__super__=t.prototype,e};e=window.LaggyDash,t=function(e){function t(){this.done=a(this.done,this)}return n(t,e),t.prototype.create=function(){var e,t;return this.game.stage.backgroundColor="#FFFFFF",this.labs=this.game.add.sprite(this.game.world.centerX,this.game.world.centerY,"labs"),this.labs.body=null,this.labs.scale.setTo(.4,.4),this.labs.anchor.setTo(.5,.5),this.labs.alpha=0,e=this.game.add.tween(this.labs),e.to({alpha:1},1e3,Phaser.Easing.Linear.None,!1),t=this.game.add.tween(this.labs),t.to({alpha:0},1e3,Phaser.Easing.Linear.None,!1),e.onComplete.addOnce(function(){return function(){return t.start()}}(this)),t.onComplete.addOnce(this.done),e.start()},t.prototype.destroy=function(){return destroy(this.labs)},t.prototype.done=function(){return this.game.state.start("landscape")},t}(Phaser.State),e.Splash=t}.call(this),function(){var e,t,a=function(e,t){return function(){return e.apply(t,arguments)}},i={}.hasOwnProperty,n=function(e,t){function a(){this.constructor=e}for(var n in t)i.call(t,n)&&(e[n]=t[n]);return a.prototype=t.prototype,e.prototype=new a,e.__super__=t.prototype,e};e=window.LaggyDash,t=function(e){function t(){this.done=a(this.done,this),this.showPlayer=a(this.showPlayer,this),this.hit=a(this.hit,this),this.jump=a(this.jump,this)}var i;return n(t,e),i=1,t.prototype.preload=function(){return window.laggydash.connect("laggydash",laggydash.game.rnd.uuid()+(":"+this.game.player_name))},t.prototype.create=function(){var e,t,a,n,s,r,o,h,d,u,l,g,p;for(this.game.stage.backgroundColor="#000055",this.night=this.game.add.sprite(this.game.world.centerX,this.game.world.centerY,"night"),this.night.body=null,this.night.alpha=0,this.night.anchor.setTo(.5,.5),t=this.game.add.tween(this.night),t.to({alpha:1},3e5/i,Phaser.Easing.Linear.None,!0,15e4/i,999,!0),this.sky=this.game.add.sprite(this.game.world.centerX,this.game.world.centerY,"sky"),this.sky.body=null,this.sky.alpha=1,this.sky.anchor.setTo(.5,.5),t=this.game.add.tween(this.sky),t.to({alpha:0},45e4/i,Phaser.Easing.Linear.None,!0,0,999,!0),this.sun=this.game.add.sprite(0,0,"sun"),this.sun.body=null,this.sun.anchor.setTo(.5,.5),this.sun.scale.setTo(.3,.4),this.sun.x=this.game.world.centerX,this.sun.y=.5*this.game.world.centerY-100,a=this.game.add.tween(this.sun.scale),a.to({x:1.5,y:1.5},45e4/i,Phaser.Easing.Cubic.InOut,!0,0,999,!0),o=this.game.add.tween(this.sun),o.to({y:675},45e4/i,Phaser.Easing.Sinusoidal.InOut,!0,0,999,!0),t=this.game.add.tween(this.sun),t.to({alpha:0},45e4/i,Phaser.Easing.Linear.None,!0,0,!0,!0),this.cloud=this.game.add.sprite(1e3,70,"cloud"),this.cloud.body=null,this.cloud.alpha=.4,r=this.game.add.tween(this.cloud),r.to({x:-800},7e4/i,Phaser.Easing.Linear.None,!0,0,999),this.mountain0a=this.game.add.sprite(0,180,"mountain0"),this.mountain0a.body=null,this.mountain0b=this.game.add.sprite(2e3,180,"mountain0"),this.mountain0b.body=null,this.collect_group=this.game.add.group(),this.mountain1a=this.game.add.sprite(0,180,"mountain1"),this.mountain1a.body=null,this.mountain1b=this.game.add.sprite(2e3,180,"mountain1"),this.mountain1b.body=null,this.player_group=this.game.add.group(),this.heightmap=[],u=122,d=l=0,p=this.mountain1a.width;p>=0?p>=l:l>=p;d=p>=0?++l:--l){if(h=this.mountain1a.input.checkPixel(d,u)){for(;h;)u-=1,h=this.mountain1a.input.checkPixel(d,u);u+=1}else for(;!(h||(u+=1,h=this.mountain1a.input.checkPixel(d,u),u>200)););this.heightmap.push(u)}for(this.mountain2a=this.game.add.sprite(0,180,"mountain2"),this.mountain2a.body=null,this.mountain2b=this.game.add.sprite(2e3,180,"mountain2"),this.mountain2b.body=null,this.mountain3a=this.game.add.sprite(0,180,"mountain3"),this.mountain3a.body=null,this.mountain3a.alpha=.4,this.mountain3b=this.game.add.sprite(2e3,180,"mountain3"),this.mountain3b.body=null,this.mountain3b.alpha=.4,r=this.game.add.tween(this.mountain0a),r.to({x:-2e3},31e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain0b),r.to({x:0},31e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain1a),r.to({x:-2e3},18e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain1b),r.to({x:0},18e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain2a),r.to({x:-2e3},13e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain2b),r.to({x:0},13e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain3a),r.to({x:-2e3},7e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.mountain3b),r.to({x:0},7e3,Phaser.Easing.Linear.None,!0,0,999),this.avatar_group=this.game.add.group(),this.exposions=[],n=g=0;5>=g;n=++g)e=this.game.add.sprite(0,0,"explosion"),e.anchor.setTo(.5,.5),e.animations.add("bang",[0,1,2,3],4,!1),e.animations.play("bang",4,!1,!0),e.kill();return this.tree0=this.game.add.sprite(2e3,490,"tree0"),this.tree0.body=null,this.tree0.anchor.setTo(.5,1),r=this.game.add.tween(this.tree0),r.to({x:-2e3},3400/i,Phaser.Easing.Linear.None,!0,3e3/i,999),this.tree1=this.game.add.sprite(2e3,490,"tree1"),this.tree1.body=null,this.tree1.anchor.setTo(.5,1),r=this.game.add.tween(this.tree1),r.to({x:-2e3},3500/i,Phaser.Easing.Linear.None,!0,7e3/i,999),this.tree2=this.game.add.sprite(2e3,490,"tree2"),this.tree2.body=null,this.tree2.anchor.setTo(.5,1),r=this.game.add.tween(this.tree2),r.to({x:-2e3},3600/i,Phaser.Easing.Linear.None,!0,13e3/i,999),this.tree3=this.game.add.sprite(2e3,490,"tree3"),this.tree3.body=null,this.tree3.anchor.setTo(.5,1),r=this.game.add.tween(this.tree3),r.to({x:-2e3},3400/i,Phaser.Easing.Linear.None,!0,17e3/i,999),this.grass1=this.game.add.sprite(0,380,"grass"),this.grass1.body=null,this.grass2=this.game.add.sprite(896,380,"grass"),this.grass2.body=null,r=this.game.add.tween(this.grass1),r.to({x:-896},1e3,Phaser.Easing.Linear.None,!0,0,999),r=this.game.add.tween(this.grass2),r.to({x:0},1e3,Phaser.Easing.Linear.None,!0,0,999),this.label_group=this.game.add.group(),this.position=0,this.players={},this.addPlayer(window.laggydash.user.replace(/:.*$/,""),this.game.player_name,!0),s=this.game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR),s.onDown.add(this.jump),this.game.input.onTap.add(this.jump),this.current=null,this.timer=this.game.time.create(),this.timer.start()},t.prototype.update=function(){var e,t,a,i,n,s,r;return this.position+=1,a=Math.round(Math.min(this.mountain1a.x,this.mountain1b.x)),this.position>200&&this.position%50===0&&(i=this.position%100===0&&this.game.rnd.frac()<.2?this.game.add.sprite(900,0,"bomb"):this.game.add.sprite(900,0,"coin"),i.body.allowGravity=!1,s="bomb"===i.key?5:15,t=s,i.body.setRectangle(s,t,i.width/2-s/2-1,i.height/2-t/2),i.body.x=i.x,i.anchor.setTo(.5,.5),i.animations.add("spin",[0,1,2,3,4,5],10,!0),i.animations.play("spin"),this.collect_group.add(i),r=(i.x-a)%2e3,t=this.game.rnd.pick([20,80]),i.y=this.heightmap[Math.round(r)]+this.mountain1a.y-t,i.alpha=1,i.move=this.game.add.tween(i),i.move.to({x:350},5e3,Phaser.Easing.Linear.None,!0,0),i.move.onComplete.add(function(e){return function(){return e.collect(i)}}(this)),i.fade=this.game.add.tween(i),i.fade.to({alpha:0},2e3,Phaser.Easing.Linear.None,!0,2500),i.revive(),this.game.rnd.frac()<.25&&(i.jump=this.game.add.tween(i),e=80===t?60:-60,i.jump.to({y:i.y+e},300,Phaser.Easing.Linear.None,!0,1400))),this.player_group.forEachAlive(function(e){return function(t){var i,n,s,o;return t.dot.y=t.avatar.y-t.avatar.height-5,t.dot.height=t.dot.y-t.y-8,r=(t.x-a)%2e3,o=e.heightmap[Math.round(r)]+e.mountain1a.y,s=t.onGround,i=t.y-o,t.onGround=i>0,-20>i&&(t.jump=!1),t.onGround&&(t.y=o,t.body.velocity.y=0,t.jump&&(t.jump=!1,t.onGround=!1,t.y-=10,t.body.velocity.y=-200,t.animations.stop(),t.frame="runner"===t.key?4:2)),!s&&t.onGround&&t.play("run"),"wolf"===t.key&&t.x===t.target&&t.onGround?(t.target=e.game.rnd.integerInRange(100,500),n=e.game.add.tween(t),n.to({x:t.target},e.game.rnd.realInRange(3e3,8e3),Phaser.Easing.Sinusoidal.InOut,!0,e.game.rnd.realInRange(0,1e4))):void 0}}(this)),null!=this.current&&(n=this.players[this.current],n.avatar.x=n.runner.x,n.runner.dot.x=n.runner.x,n.label.x=n.runner.x-n.label.width/2),null!=this.prev&&(n=this.players[this.prev],n.avatar.x=n.runner.x,n.runner.dot.x=n.runner.x,n.label.x=n.runner.x-n.label.width/2),this.player_group.forEachAlive(function(e){return function(t){return"runner"===t.key?e.game.physics.overlap(t,e.collect_group,e.hit):void 0}}(this))},t.prototype.jump=function(){return this.player_group.forEachAlive(function(){return function(e){return"runner"===e.key?(e.jump=!0,window.laggydash.send({action:"jump"})):void 0}}(this))},t.prototype.hit=function(e,t){return this.collect(t)},t.prototype.collect=function(e){return this.game.tweens.remove(e.move),e.move=null,this.game.tweens.remove(e.jump),e.jump=null,this.game.tweens.remove(e.fade),e.fade=null,e.destroy()},t.prototype.addPlayer=function(e,t,a){var i,n,s,r,o,h,d,u,l,g,p,m;return null==a&&(a=!1),m=a?600:this.game.rnd.integerInRange(100,500),l=a?"runner":"wolf",s=a?8:12,d=a?.9:1,u=this.game.add.sprite(m,0,l),u.animations.add("run",[0,1,2,3,4,5],s,!0),u.anchor.setTo(.5,d),u.onGround=!1,u.jump=!1,u.frame=a?3:4,u.target=m,u.id=e,a&&(p=20,o=40,u.body.setRectangle(p,o,u.width/2-p/2,u.height/2-o/2),u.body.x=u.x),this.player_group.add(u),i=this.game.add.sprite(m,475,"@"+t),i.body=null,i.id=e,i.name=t,i.width=60,i.height=60,i.anchor.setTo(.5,1),i.alpha=0,i.inputEnabled=!0,i.useHandCursor=!0,i.events.onInputDown.add(function(){return function(){return i.alpha>.5?window.laggydash.showUser(t):void 0}}(this)),this.avatar_group.add(i),n=this.game.add.sprite(m,i.y,"dot"),n.body=null,n.id=e,n.height=100,n.anchor.setTo(.5,1),n.alpha=0,u.dot=n,u.avatar=i,this.avatar_group.add(n),g={font:"10pt Courier",fill:"#ffffff"},h=this.game.add.text(m,480,"@"+t,g),h.x-=h.width/2,h.alpha=0,this.label_group.add(h),a?(r=this.game.add.tween(i),r.to({alpha:.8},1e3,Phaser.Easing.Linear.None,!0,2e3),r=this.game.add.tween(n),r.to({alpha:.3},1e3,Phaser.Easing.Linear.None,!0,2e3),r=this.game.add.tween(h),r.to({alpha:1},1e3,Phaser.Easing.Linear.None,!0,2e3)):this.players[e]={runner:u,avatar:i,label:h}},t.prototype.showPlayer=function(){var e,t,a,i,n,s,r;if(a=_.keys(this.players),0===a.length)return this.current=null,this.prev=null,void 0;for(null!=this.current&&a.length>1&&(this.prev=this.current,a=_.without(a,this.current),i=this.players[this.current],t=this.game.add.tween(i.avatar),t.to({alpha:0},1e3,Phaser.Easing.Linear.None,!0),t=this.game.add.tween(i.runner.dot),t.to({alpha:0},1e3,Phaser.Easing.Linear.None,!0),t=this.game.add.tween(i.label),t.to({alpha:0},1e3,Phaser.Easing.Linear.None,!0)),this.current=this.game.rnd.pick(a),i=this.players[this.current],t=this.game.add.tween(i.avatar),t.to({alpha:.8},1e3,Phaser.Easing.Linear.None,!0,500),t=this.game.add.tween(i.runner.dot),t.to({alpha:.3},1e3,Phaser.Easing.Linear.None,!0,500),t=this.game.add.tween(i.label),t.to({alpha:1},1e3,Phaser.Easing.Linear.None,!0,500),r=this.timer.events,n=0,s=r.length;s>n;n++)e=r[n],this.timer.remove(e);return this.timer.add(8e3,this.showPlayer)},t.prototype.delPlayer=function(e){return null!=this.players[e]?(this.players[e].runner.dot.destroy(),this.players[e].runner.destroy(),this.players[e].avatar.destroy(),this.players[e].label.destroy(),delete this.players[e],this.current===e&&(this.current=null,this.showPlayer()),this.prev===e?this.prev=null:void 0):void 0},t.prototype.avatarLoaded=function(e){return this.avatar_group.forEach(function(){return function(t){return"__missing"===t.key&&e==="@"+t.name?(t.loadTexture(e),t.width=60,t.height=60):void 0}}(this))},t.prototype.handle=function(e){switch(e.action){case"join":if(this.addPlayer(e.id,e.name),null===this.current)return this.showPlayer();break;case"bail":return this.delPlayer(e.id);case"jump":return this.player_group.forEachAlive(function(){return function(t){return t.id===e.id?t.jump=!0:void 0}}(this))}},t.prototype.delMob=function(e,t){return console.log("ADD "+t)},t.prototype.destroy=function(){return destroy(this.tree0),destroy(this.tree1),destroy(this.tree2),destroy(this.tree3),destroy(this.night),destroy(this.sky),destroy(this.sun),destroy(this.cloud),destroy(this.grass1),destroy(this.grass2),destroy(this.runner)},t.prototype.done=function(){return this.game.state.start("splash")},t}(Phaser.State),e.Landscape=t}.call(this),function(){var e,t,a,i,n=function(e,t){return function(){return e.apply(t,arguments)}},s={}.hasOwnProperty,r=function(e,t){function a(){this.constructor=e}for(var i in t)s.call(t,i)&&(e[i]=t[i]);return a.prototype=t.prototype,e.prototype=new a,e.__super__=t.prototype,e};e=window.LaggyDash,i=e.Splash,t=e.Landscape,a=function(e){function a(e){this.parent=null!=e?e:"",this._message=n(this._message,this),this._presence=n(this._presence,this),this.startGame=n(this.startGame,this),this.ready=n(this.ready,this)}return r(a,e),a.prototype.run=function(e){var t;return null==e&&(e=!1),t=e?Phaser.CANVAS:Phaser.AUTO,new Phaser.Game(896,504,t,this.parent,this)},a.prototype.destroy=function(){return destroy(this.text),destroy(this.graphics)},a.prototype.preload=function(){var e,a;return this.game.stage.disableVisibilityChange=!0,this.game.stage.scale.pageAlignHorizontally=!0,this.game.stage.scale.pageAlignVertically=!1,this.game.stage.scale.setShowAll(),this.game.stage.scale.refresh(),this.game.stage.scale.enterLandscape.add(function(e){return function(){return e.game.stage.scale.setShowAll(),e.game.stage.scale.refresh()}}(this)),this.game.stage.scale.enterPortrait.add(function(e){return function(){return e.game.stage.scale.setShowAll(),e.game.stage.scale.refresh()}}(this)),this.setPlayerName(location.search),this.game.physics.gravity.y=400,e="=== L A G G Y D A S H ===\nis\nLOADING",a={font:"30px Courier",fill:"#00ff44",align:"center"},this.text=this.game.add.text(this.game.world.centerX,this.game.world.centerY,e,a),this.text.anchor.setTo(.5,.5),this.graphics=this.game.add.graphics(0,0),this.graphics.lineStyle(1,5605580,1),this.graphics.drawRect(199,339,502,22),this.game.load.onLoadComplete.addOnce(this.ready),this.game.state.add("splash",new i,!1),this.game.state.add("landscape",new t,!1),this.game.load.image("labs","images/labs-6e6507d0.png"),this.game.load.image("night","images/night_sky-536d3c4e.png"),this.game.load.image("stars","images/night_stars-db528057.png"),this.game.load.image("sky","images/sky-7c5c1b96.jpg"),this.game.load.image("sun","images/sun-9189a743.png"),this.game.load.image("cloud","images/cloud-16060b57.png"),this.game.load.image("mountain0","images/mountain0-f8f2cbad.png"),this.game.load.image("mountain1","images/mountain1-8de3a136.png"),this.game.load.image("mountain2","images/mountain2-1d8dfe88.png"),this.game.load.image("mountain3","images/mountain3-baf33425.png"),this.game.load.image("grass","images/grass-d6b8cba6.png"),this.game.load.image("tree0","images/tree0-23f3bb56.png"),this.game.load.image("tree1","images/tree1-769d4031.png"),this.game.load.image("tree2","images/tree2-646e82b2.png"),this.game.load.image("tree3","images/tree3-514f4f08.png"),this.game.load.image("dot","images/dot-309749be.png"),this.game.load.spritesheet("runner","images/running-cb59ff48.png",44,64,6),this.game.load.spritesheet("wolf","images/wolf-aa062f94.png",64,32,6),this.game.load.spritesheet("coin","images/coin-28be484f.png",16,18,6),this.game.load.spritesheet("bomb","images/bomb-3e619ff7.png",18,18,6),this.game.load.spritesheet("explosion","images/explosion-5fb4e372.png",32,32,4)},a.prototype.loadRender=function(){return this.graphics.beginFill(65348),this.graphics.drawRect(200,340,5*this.game.load.progress,20),this.graphics.endFill()},a.prototype.render=function(){return this.graphics.clear(),this.game.load.hasLoaded?void 0:this.loadRender()},a.prototype.ready=function(){var e,t;return this.game.load.onFileComplete.add(function(e){return function(t,a){return e.onAvatarLoaded(a)}}(this)),this.text.alpha=0,null!=this.game.player_name?this.startGame():(e="Your Twitter Handle (so we can show you in the game)",t={labels:{ok:"Play",cancel:"Surprise Me"}},alertify.set(t),alertify.prompt(e,function(e){return function(t,a){return t&&e.setPlayerName(a),null==e.game.player_name&&e.randomPlayerName(),e.startGame()}}(this)))},a.prototype.setPlayerName=function(e){return null!=e?(this.game.player_name=e.replace(/[^a-z0-9_]/i,"").toLowerCase(),this.game.player_name.length<1||this.game.player_name.length>15?this.game.player_name=null:void 0):void 0},a.prototype.randomPlayerName=function(){var e,t;return e=["BarackObama","Eminem","BillGates","ParisHilton","ConanOBrien","tomhanks","TheRock","stephenfry","MichelleObama"],t=this.game.rnd.pick(e),this.setPlayerName(t)},a.prototype.startGame=function(){return this.game.state.start("splash")},a.prototype.connect=function(e,t){return this.channel=e,this.user=t,this.pubnub=PUBNUB.init({publish_key:"pub-c-e5d7da60-f65b-4173-b353-2b06890cfe5b",subscribe_key:"sub-c-4cf670be-96d5-11e3-b9e1-02ee2ddab7fe",uuid:this.user}),this.pubnub.subscribe({channel:e,message:this._message,presence:this._presence})},a.prototype.send=function(e){return this.pubnub.publish({channel:this.channel,message:{uuid:this.user,data:e}})},a.prototype.loadAvatar=function(e){var t;if(t="@"+e,this.game.cache.checkImageKey(t)||this.game.load.checkKeyExists("image",t));else if(this.game.load.image(t,"http://res.cloudinary.com/kranzky/image/twitter_name/"+e+".jpg"),!this.game.load.isLoading)return this.game.load.start()},a.prototype.onAvatarLoaded=function(e){return"landscape"===laggydash.game.state.current?this.game.state.getCurrentState().avatarLoaded(e):void 0},a.prototype.showUser=function(e){return this.openWindow("https://twitter.com/intent/user?screen_name="+e)},a.prototype.tweet=function(e,t){var a,i;return i=encodeURI("http://laggydash.com/"),e=encodeURI(e),a=encodeURI(t.toString()),this.openWindow("https://twitter.com/intent/tweet?text="+e+"&hashtags=laggydash&url="+i+"&related="+a+"&")},a.prototype.openWindow=function(e){var t,a,i,n,s;return s="scrollbars=yes,resizable=yes,toolbar=no,location=yes",n=550,t=420,a=Math.round(screen.width/2-n/2),i=0,screen.height>t&&(i=Math.round(screen.height/2-t/2)),window.open(e,"intent",""+s+",width="+n+",height="+t+",left="+a+",top="+i)},a.prototype._presence=function(e){var t,a;if(a=e.uuid.replace(/:.*$/i,""),t=e.uuid.replace(/^.*:/i,""),e.uuid!==this.user)switch(e.action){case"join":this._handle({id:a,action:"join",name:t}),alertify.success("@"+t+" has joined");break;case"leave":this._handle({id:a,action:"bail",name:t}),alertify.error("@"+t+" has bailed")}return(e.action="join")?this.loadAvatar(t):void 0},a.prototype._message=function(e){var t,a;if(e.uuid!==this.user)return a=e.uuid.replace(/:.*$/i,""),t=e.uuid.replace(/^.*:/i,""),e.data.id=a,e.data.name=t,this._handle(e.data)},a.prototype._handle=function(e){return"landscape"===laggydash.game.state.current?this.game.state.getCurrentState().handle(e):void 0},a}(Phaser.State),e.Main=a}.call(this),function(){}.call(this);
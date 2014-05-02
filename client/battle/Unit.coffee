class @Unit
	constructor: (@uname, @bat) ->
		@Fam = getFamLib().init()
		i = _.random(20)
		imgurl = "/units/monster/#{uname}_monster.png"

		@surf = new @Fam.ImageSurface(
			content: imgurl
			size: [ 100, 100 ]
			properties:
				# backgroundColor: "hsl(" + (i * 360 / 20) + ", 100%, 50%)"
				backgroundColor: "white"
		)
		@surf.addClass("rounder")


	# bounce: () ->
	# 	@modifier = new Modifier(
	# 		origin: [
	# 			.5
	# 			.5
	# 		]
	# 		transform: Transform.translate(0, 0, 0)
	# 	)
	# 	Transitionable.registerMethod "tween", TweenTransition
	# 	transitionable = new Transitionable(1)
	# 	@modifier.opacityFrom ->
	# 		transitionable.get()
	# 	transition =
	# 		method: "tween"
	# 		curve: "easeInOut"
	# 		duration: 1500
	# 	@surf.on "click", ->
	# 		console.log("clicked")
	# 		transitionable.set 0, transition
	# 	return


	bounce: (other) ->
		# @surf.properties.backgroundColor = "red"
		# setTimeout (=> @reset(@) ), 1000
		other.surf.properties.backgroundColor = "red"
		setTimeout (=> other.reset() ), 1000


	reset: (who) ->
		console.log("reset", @uname)
		@surf.properties.backgroundColor = "green"

	addBody: (opts) ->
		console.log("addBody, @Fam", @Fam)
		@body = new @Fam.Circle(
			radius : 50
			velocity : opts.vel		# 1ms = 1 px
			position: opts.pos
		)

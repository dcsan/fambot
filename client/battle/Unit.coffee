class @Unit
	constructor: (@opts) ->
		# @opts = opts
		@uname = @opts.uname

		console.log("constructor opt:", @opts)
		check(@opts.velocity, [Number] )

		@Fam = getFamLib().init()
		i = _.random(20)
		imgurl = "/units/monster/#{@uname}_monster.png"

		@opts.size ?= [100,100]
		@surf = new @Fam.ImageSurface(
			content: imgurl
			size: @opts.size
			properties:
				# backgroundColor: "hsl(" + (i * 360 / 20) + ", 100%, 50%)"
				backgroundColor: "white"
		)
		@surf.addClass("rounder")
		@addBody(@opts)


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
		# console.log("reset", @uname)
		@surf.properties.backgroundColor = "green"

	addBody: (obj) ->
		obj.origin = [
			- obj.size[0] * 3
			- obj.size[1] * 3
			- obj.size[2] * 3
		]
		# obj.position = [
		# 	- obj.size[0] * 3
		# 	- obj.size[1] * 3
		# 	- obj.size[2] * 3
		# ]
		obj.radius = obj.size[0] / 2
		console.log("addBody", obj)
		@body = new @Fam.Circle(obj)

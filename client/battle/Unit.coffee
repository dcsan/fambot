Modifier        = require("famous/core/Modifier")
Transform       = require("famous/core/Transform")
Transitionable  = require("famous/transitions/Transitionable")
TweenTransition = require("famous/transitions/TweenTransition")
Circle			= require("famous/physics/bodies/Circle")


class @Unit
	constructor: (@uname, @bat) ->
		# FIX needs document.body - where best to include?
		ImageSurface = require("famous/surfaces/ImageSurface")
		Surface = require("famous/core/Surface") 
		i = _.random(20)
		imgurl = "/units/monster/#{uname}_monster.png"

		@surf = new ImageSurface(
			content: imgurl
			size: [ 100, 100 ]
			properties:
				# backgroundColor: "hsl(" + (i * 360 / 20) + ", 100%, 50%)"
				backgroundColor: "green"
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


	bounce: (opts) ->
		@surf.properties.backgroundColor = "red"

	addBody: (opts) ->
		@body = new Circle(
			radius : 50
			velocity : opts.vel		# 1ms = 1 px
			position: opts.pos
		)




# Rig some famo.us deps
require "famous-polyfills" # Add polyfills
require "famous/core/famous" # Add the default css file

# Basic deps
Engine = require("famous/core/Engine")
Modifier = require("famous/core/Modifier")
RenderController = require("famous/views/RenderController")


unitIcon = (unit) ->

	# FIX needs document.body - where best to include?
	ImageSurface = require("famous/surfaces/ImageSurface")
	Surface = require("famous/core/Surface") 
	mainContext = Engine.createContext()
	renderController = new RenderController()
	i = 3

	surf = new ImageSurface(
		# content: "Surface: " + (i + 1)
		size: [ true, true ]
		properties:
			backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
			lineHeight: "200px"
			textAlign: "center"
	)

	surf.setContent("/units/monster/#{unit}_monster.png")

	renderController.show surf
	mainContext.add(new Modifier(origin: [
		.5
		.5
	])).add renderController
	return




Template.unit.icon = (unit) ->
	console.log("icon unit: #{unit}")
	unitIcon(unit)
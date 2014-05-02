# Rig some famo.us deps
require "famous-polyfills" # Add polyfills
require "famous/core/famous" # Add the default css file

# Basic deps
# Engine = require("famous/core/Engine")
# Modifier = require("famous/core/Modifier")
# RenderController = require("famous/views/RenderController")


unitIcon = (uname) ->

	# FIX needs document.body - where best to include?
	# ImageSurface = require("famous/surfaces/ImageSurface")
	# Surface = require("famous/core/Surface") 
	# mainContext = Engine.createContext()
	@fam = getFamLib().init()
	mainContext = @fam.Engine.createContext()
	if @ctrl
		@ctrl.hide()

	@ctrl = new @fam.RenderController()

	i = 3

	surf = new @fam.Surface(
		# content: "Surface: " + (i + 1)
		size: [ 200, 50 ]
		properties:
			backgroundColor: "black"
			color: "white"
			lineHeight: "2"
			textAlign: "center"
	)

	# imgurl = "/units/monster/#{uname}_monster.png"
	# surf.setContent("")
	# surf.setContent("<img src='#{imgurl}' class='rounder' />")

	# surf.addClass("rounder")
	surf.setContent("<div>#{uname}</div>")

	@ctrl.show surf
	mainContext.add(new @fam.Modifier(origin: [
		.5
		.5
	])).add @ctrl
	return




Template.unit.icon = (uname) ->
	console.log("icon unit: #{uname}")
	unitIcon(uname)
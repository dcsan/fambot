
@bat = {}

# Rig some famo.us deps
require "famous-polyfills" # Add polyfills
require "famous/core/famous" # Add the default css file

# Basic deps
Engine = require("famous/core/Engine")
Modifier = require("famous/core/Modifier")
RenderController = require("famous/views/RenderController")
Modifier        = require("famous/core/Modifier")
Transform       = require("famous/core/Transform")
Transitionable  = require("famous/transitions/Transitionable")
TweenTransition = require("famous/transitions/TweenTransition")

class Unit
	constructor: (@uname, @bat) ->
		# FIX needs document.body - where best to include?
		ImageSurface = require("famous/surfaces/ImageSurface")
		Surface = require("famous/core/Surface") 
		i = _.random(20)

		@surf = new ImageSurface(
			# content: "Surface: " + (i + 1)
			size: [ true, true ]
			properties:
				backgroundColor: "hsl(" + (i * 360 / 20) + ", 100%, 50%)"
		)
		@surf.setContent("/units/monster/#{uname}_monster.png")

	bounce: () ->
		@modifier = new Modifier(
			origin: [
				.5
				.5
			]
			transform: Transform.translate(0, 0, 0)
		)
		Transitionable.registerMethod "tween", TweenTransition
		transitionable = new Transitionable(1)
		@modifier.opacityFrom ->
			transitionable.get()

		transition =
			method: "tween"
			curve: "easeInOut"
			duration: 1500

		@surf.on "click", ->
			console.log("clicked")
			transitionable.set 0, transition
		return



class Battle
	constructor: (@allUnits) ->
		@vw = window.innerWidth
		@vh = window.innerHeight
		@units = []
		@lastUnit = null
		mainContext = Engine.createContext()
		@renderController = new RenderController()
		mainContext.add(new Modifier(origin: [
			.5
			.5
		])).add @renderController

	addUnit: (uname) ->
		unit = new Unit(uname)
		@units.push(unit)
		@renderController.show (unit.surf)
		console.log("new unit", unit)
		unit.bounce()
		return unit

	hideUnit: (uname) ->
		u = @units.pop()
		@renderController.hide (u.surf)
		console.log("hid", u)




Template.unit.icon = (unit) ->
	console.log("icon unit: #{unit}")
	unitIcon(unit)

Template.battle.init = (units) ->
	return unless units
	@bat = new Battle(units)
	console.log("battle.init", @bat, units)
	# @bat.addUnit(units[0])
	window.bat = @bat
	return "ready"



Template.battle.greeting = () ->
	return "welcome back"


Template.battle.events =
	"click #addMon": (event) ->
		uname = _.sample(@bat.allUnits)
		console.log "addMon", uname
		unit = @bat.addUnit(uname)

	"click #delMon": (event) ->
		@bat.hideUnit()




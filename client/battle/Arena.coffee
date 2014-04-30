Engine 			= require("famous/core/Engine")
Modifier 		= require("famous/core/Modifier")
RenderController= require("famous/views/RenderController")

class @Arena
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

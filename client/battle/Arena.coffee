Engine 			= require("famous/core/Engine")
Modifier 		= require("famous/core/Modifier")
RenderController= require("famous/views/RenderController")
PhysicsEngine	= require("famous/physics/PhysicsEngine")
Collision 		= require("famous/physics/constraints/Collision")
Transform       = require("famous/core/Transform")

class @Arena
	constructor: (@allUnits) ->
		@vw = window.innerWidth
		@vh = window.innerHeight
		@units = []
		@lastUnit = null
		@mainContext = Engine.createContext()
		@physicsEngine = new PhysicsEngine()

		@collision = new Collision({restitution : .7})

		# @renderController = new RenderController()
		# @mainContext.add(new Modifier(origin: [
		# 	.5
		# 	.5
		# ])).add @renderController
		

	addUnit: (uname, opts) ->
		unit = new Unit(uname)
		unit.addBody(opts)

		@units.push(unit)
		# @renderController.show (unit.surf)
		console.log("new unit", unit)
		# unit.bounce()
		@physicsEngine.addBody(unit.body)

		mod = new Modifier(
			{
				transform: Transform.translate(opts.px, 0, 0)
			}
		)

		@mainContext.add(unit.body).add(unit.surf)
		# @mainContext.add(unit.body).add(mod).add(unit.surf)

		# @renderController.add(unit.body).add(unit.surf)
		# @physicsEngine.attach(collision, circle1, circle2)
		return unit

	hideUnit: (uname) ->
		u = @units.pop()
		# @renderController.hide (u.surf)
		console.log("hid", u)

	setCollision: (obj1, obj2) ->
		@physicsEngine.attach(@collision, obj1, obj2)
		@collision.on 'collide', ->
			console.log("collide")


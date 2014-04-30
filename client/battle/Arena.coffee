Engine 			= require("famous/core/Engine")
Modifier 		= require("famous/core/Modifier")
RenderController= require("famous/views/RenderController")
PhysicsEngine	= require("famous/physics/PhysicsEngine")
Collision 		= require("famous/physics/constraints/Collision")
Transform       = require("famous/core/Transform")
Walls 			= require("famous/physics/constraints/Walls")
Wall 			= require("famous/physics/constraints/Wall")

class @Arena
	constructor: (@allUnits) ->
		@vw = window.innerWidth
		@vh = window.innerHeight
		@units = []
		@lastUnit = null
		@walls = []
		@mainContext = Engine.createContext()
		@physicsEngine = new PhysicsEngine(
			origin: [0.5, 0.5, 0.5]
		)

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

	addWalls: (opts) ->
		# left wall
		@walls.push = new Wall({normal : [  1,0,0], distance : 200})
		@walls.push = new Wall({normal : [  -1,0,0], distance : 300})
		@walls.push = new Wall({normal : [   0,1,0], distance : 300})

		# @walls = new Walls()
		console.log("created walls")
		for w in @walls
			@physicsEngine.attach(w)

	hideUnit: (uname) ->
		u = @units.pop()
		# @renderController.hide (u.surf)
		console.log("hid", u)

	setCollision: (obj1, obj2) ->
		@physicsEngine.attach(@collision, obj1, obj2)
		@collision.on 'collision', ->
			console.log("collide")


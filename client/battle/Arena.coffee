console.log("setup Arena")

Engine 			= require("famous/core/Engine")
Modifier 		= require("famous/core/Modifier")
RenderController= require("famous/views/RenderController")
PhysicsEngine	= require("famous/physics/PhysicsEngine")
Collision 		= require("famous/physics/constraints/Collision")
Transform       = require("famous/core/Transform")
Walls 			= require("famous/physics/constraints/Walls")
Wall 			= require("famous/physics/constraints/Wall")
Transitionable  = require("famous/transitions/Transitionable")
TweenTransition = require("famous/transitions/TweenTransition")
Circle			= require("famous/physics/bodies/Circle")

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
		@addBox(unit)
		return unit

	addBox: (unit) ->
		contextSize = @mainContext.getSize()
		leftWall    = new Wall({normal : [1,0,0],  distance : contextSize[0]/2.0, restitution : 0.5});
		rightWall   = new Wall({normal : [-1,0,0], distance : contextSize[0]/2.0, restitution : 0.5});
		topWall     = new Wall({normal : [0,1,0],  distance : contextSize[1]/2.0, restitution : 0.5});
		bottomWall  = new Wall({normal : [0,-1,0], distance : contextSize[1]/2.0, restitution : 0.5});

		@physicsEngine.attach( leftWall,  [unit.body]);
		@physicsEngine.attach( rightWall, [unit.body]);
		@physicsEngine.attach( topWall,   [unit.body]);
		@physicsEngine.attach( bottomWall,[unit.body]);


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
		@collision.on 'collision', (evt) ->
			console.log("collide", evt)


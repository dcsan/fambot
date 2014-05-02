class @Arena
	constructor: (@allUnits, @fam) ->
		@fam.init()
		console.log("construct Arena", @Fam)
		@vw = window.innerWidth
		@vh = window.innerHeight
		@units = []
		@lastUnit = null
		@walls = []
		@mainContext = @fam.Engine.createContext()
		@physicsEngine = new @fam.PhysicsEngine(
			origin: [0.5, 0.5, 0.5]
		)

		# @collision = new @fam.Collision({restitution : .7})

		# @renderController = new @fam.RenderController()
		# @mainContext.add(new @fam.Modifier(origin: [
		# 	.5
		# 	.5
		# ])).add @renderController
		

	addUnit: (uname, opts) ->
		unit = new Unit(uname)
		unit.addBody(opts)

		@units.push(unit)
		# @renderController.show (unit.surf)
		console.log("new @fam.unit", unit)
		# unit.bounce()
		@physicsEngine.addBody(unit.body)

		mod = new @fam.Modifier(
			{
				transform: @fam.Transform.translate(opts.px, 0, 0)
			}
		)
		@mainContext.add(unit.body).add(unit.surf)
		# @mainContext.add(unit.body).add(mod).add(unit.surf)
		# @renderController.add(unit.body).add(unit.surf)
		# @physicsEngine.attach(collision, circle1, circle2)
		# @addBox(unit)
		return unit

	addBox: (unit) ->
		contextSize = @mainContext.getSize()
		leftWall    = new @fam.Wall({normal : [1,0,0],  distance : contextSize[0]/2.0, restitution : 0.5});
		rightWall   = new @fam.Wall({normal : [-1,0,0], distance : contextSize[0]/2.0, restitution : 0.5});
		topWall     = new @fam.Wall({normal : [0,1,0],  distance : contextSize[1]/2.0, restitution : 0.5});
		bottomWall  = new @fam.Wall({normal : [0,-1,0], distance : contextSize[1]/2.0, restitution : 0.5});

		@physicsEngine.attach( leftWall,  [unit.body]);
		@physicsEngine.attach( rightWall, [unit.body]);
		@physicsEngine.attach( topWall,   [unit.body]);
		@physicsEngine.attach( bottomWall,[unit.body]);


	addWalls: (opts) ->
		# left wall
		@walls.push = new @fam.Wall({normal : [  1,0,0], distance : 200})
		@walls.push = new @fam.Wall({normal : [  -1,0,0], distance : 300})
		@walls.push = new @fam.Wall({normal : [   0,1,0], distance : 300})

		# @walls = new @fam.Walls()
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


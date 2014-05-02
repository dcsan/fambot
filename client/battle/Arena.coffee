window.ctx = null

class @Arena
	constructor: (@unitNames, @fam) ->
		@fam.init()
		@bouncey = 0.5
		console.log("construct Arena")
		@vw = window.innerWidth
		@vh = window.innerHeight

		@mainContext = window.ctx || @fam.Engine.createContext()

		@physicsEngine = new @fam.PhysicsEngine(
			origin: [0.5, 0.5, 0.5]
		)
		@setup()
		
	setup: () ->
		@units = []
		@lastUnit = null
		@walls = []
		@ctrl = new @fam.RenderController()
		@node = new @fam.RenderNode()


	# when returning to battle
	reset: () ->
		@ctrl.hide()
		@setup()

	addUnit: (uname, opts) ->
		unit = new Unit(uname, opts)
		@physicsEngine.addBody(unit.body)

		for other in @units
			@addCollision(unit, other)

		# @mainContext.add(unit.body).add(unit.surf)
		@node.add(unit.body).add(unit.modifier).add(unit.surf)
		@ctrl.show(@node)
		@mainContext.add(@ctrl)
		@units.push(unit)
		@addBox(unit)

		console.log("new @fam.unit", unit)
		return unit

	addBox: (unit) ->
		contextSize = @mainContext.getSize()
		fudge = unit.surf.getSize()
		fudge = [0,0]  ## remove fudging to show bug

		leftWall    = new @fam.Wall({normal : [1,0,0],  distance : fudge[0]/2 , restitution : @bouncey});
		rightWall   = new @fam.Wall({normal : [-1,0,0], distance : contextSize[0] - fudge[1]/2, restitution : @bouncey});
		topWall     = new @fam.Wall({normal : [0,1,0],  distance : fudge[1]/2 , restitution : @bouncey});
		bottomWall  = new @fam.Wall({normal : [0,-1,0], distance : contextSize[1] - fudge[1]/2, restitution : @bouncey});

		@physicsEngine.attach( leftWall,  [unit.body]);
		@physicsEngine.attach( rightWall, [unit.body]);
		@physicsEngine.attach( topWall,   [unit.body]);
		@physicsEngine.attach( bottomWall,[unit.body]);


	# addWalls: (opts) ->
	# 	# left wall
	# 	@walls.push = new @fam.Wall({normal : [  1,0,0], distance : 200})
	# 	@walls.push = new @fam.Wall({normal : [  -1,0,0], distance : 300})
	# 	@walls.push = new @fam.Wall({normal : [   0,1,0], distance : 300})

	# 	# @walls = new @fam.Walls()
	# 	console.log("created walls")
	# 	for w in @walls
	# 		@physicsEngine.attach(w)

	hideUnit: (uname) ->
		u = @units.pop()
		# @renderController.hide (u.surf)
		console.log("hid", u)

	addCollision: (unit1, unit2) ->
		collision = new @fam.Collision({restitution : 0.7 })
		@physicsEngine.attach(collision, unit1.body, unit2.body)
		console.log("addCollision", unit1, unit2)
		collision.on 'collision', (evt) =>
			unit1.bounce(unit2)
			console.log("collide: #{unit1.uname} #{unit2.uname}")


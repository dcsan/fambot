@bat = {}

# Rig some famo.us deps
require "famous-polyfills" # Add polyfills
require "famous/core/famous" # Add the default css file

# Basic deps

Template.unit.icon = (unit) ->
	console.log("icon unit: #{unit}")
	unitIcon(unit)

Template.battle.init = (units) ->
	return unless units
	console.log("init with", units)
	@bat = new Arena(units)
	console.log("battle.init", @bat, units)
	unit1 = @bat.addUnit(units[0], {
		pos: [ 100,      0, 0]
		vel: [ 0.1, 0.01, 0]
	})
	unit2 = @bat.addUnit(units[0], {
		pos: [ 300, 0, 0]
		vel: [ -0.1, 0.01, 0]
		# vel: [ 0, 0.01, 0]
	})

	console.log("setCollision", unit1.body, unit2.body)
	
	@bat.setCollision(unit1.body, unit2.body)
	# @bat.addWalls()
	window.bat 	 = @bat
	window.unit1 = unit1
	window.unit2 = unit2
	return "ready"


randomVec = (vx, vy, vz)->
	x = _.random(vx || @bat.vw * 100)/100
	y = _.random(vy || @bat.vh * 100)/100
	z = 1
	[x, y, z]


Template.battle.greeting = () ->
	return "welcome back"


Template.battle.events =
	"click #addMon": (event) ->
		uname = _.sample(@bat.allUnits)
		console.log "addMon", uname

		pos = randomVec()

		unit = @bat.addUnit(uname,
			pos: randomVec(100,100,1)
			vel: randomVec(10, 10, 10)
		)

	"click #delMon": (event) ->
		@bat.hideUnit()

	"click #wallsTest": (event) ->
		Template.battle.wallsTest()

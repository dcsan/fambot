# @battle = {}

# Rig some famo.us deps
# require "famous-polyfills" # Add polyfills
# require "famous/core/famous" # Add the default css file

# Basic deps

Template.unit.icon = (unit) ->
	console.log("icon unit: #{unit}")
	unitIcon(unit)

Template.battle.init = (unitNames) ->
	return unless unitNames
	Session.set('unitNames', unitNames)
	fam = getFamLib()
	@battle = new Arena(unitNames, fam)
	window.battle = @battle

	u1 = randomUnit()
	u2 = randomUnit()

	# @battle.addCollision(u1, u2)

	return "ready"

randomUnit = () ->
	@battle = window.battle
	console.log("randomUnit", @battle)
	uname = _.sample(@battle.unitNames)
	# pos = randomVec(1,1,1)
	pos = [0,0,0]

	unit = battle.addUnit(uname,
		pos: pos
		vel: randomVec(10, 10, 0)
	)
	return unit

randomVec = (vx=1, vy=1, vz=0)->
	x = _.random(vx * 100)/100.0
	y = _.random(vy * 100)/100.0
	z = 0
	[x, y, z]


Template.battle.greeting = () ->
	return "welcome back"


Template.battle.events =
	"click #addMon": (event) ->
		randomUnit()

	"click #delMon": (event) ->
		@bat.hideUnit()

	"click #wallsTest": (event) ->
		Template.battle.wallsTest()

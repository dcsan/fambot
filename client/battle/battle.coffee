
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
	@bat = new Arena(units)
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




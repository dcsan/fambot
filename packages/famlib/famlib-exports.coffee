
### leave this in famono
	# fam.fills = require("famous-polyfills"); 
	# fam.Core =require("famous/core/famous");
###

getFamLib = ->
	@famlib ||= {}


Meteor.startup ->
	fam = getFamLib()
	fam.Engine 				= require("famous/core/Engine")
	fam.Modifier 			= require("famous/core/Modifier")
	fam.RenderController	= require("famous/views/RenderController")
	fam.Transform       	= require("famous/core/Transform")
	fam.Transitionable  	= require("famous/transitions/Transitionable")
	fam.TweenTransition 	= require("famous/transitions/TweenTransition")
	fam.SpringTransition	= require("famous/transitions/SpringTransition")
	fam.PhysicsEngine		= require("famous/physics/PhysicsEngine")
	fam.Wall 				= require("famous/physics/constraints/Wall")
	# fam.Walls 				= require("famous/physics/constraints/Walls")
	fam.Circle				= require("famous/physics/bodies/Circle")
	fam.Collision 			= require("famous/physics/constraints/Collision")

	console.log("FamLib loaded", fam)

	# has to happen after we have a DOM
	fam.init = () ->
		fam = getFamLib()
		# console.log("FamLib.init", fam)
		if (fam.Surface)
			# console.log("skipping 2nd init")
		else
			fam.Surface 	 = require("famous/core/Surface")
			fam.ImageSurface = require("famous/surfaces/ImageSurface")
		
		# console.log("famous.init() done", fam)
		return fam



# mod = new @fam.Modifier(
# 	{
# 		transform: @fam.Transform.translate(opts.px, 0, 0)
# 	}
# )

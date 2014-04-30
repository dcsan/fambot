
if Meteor.isClient
	## this seems kludgey
	@initFamous = () ->
		@Fam = {}
		require("famous-polyfills")
		require("famous/core/famous")
		@Fam.Surface = require("famous/core/Surface")
		@Fam.SpringTransition = require("famous/transitions/SpringTransition")
		@Fam.Modifier = require("famous/core/Modifier")
		@Fam.Transform = require("famous/core/Transform")
		Fam.Engine = require("famous/core/Engine")
		console.log('initFamous', @Fam)

		@Fam.springy = {
			method: Fam.SpringTransition,
			period: 300,
			dampingRatio: 0.5 		# higher is less wobble
			velocity: 0.01			# some odd squash/stretch effect
		}
		console.log("initialized famous")
		return @Fam
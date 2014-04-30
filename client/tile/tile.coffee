createTile = ->

	Surface = require("famous/core/Surface") # This one needs document.body
	mainContext = Engine.createContext()
	renderController = new RenderController()
	surfaces = []
	counter = 0
	i = 0

	while i < 10
		surfaces.push new Surface(
			content: "Surface: " + (i + 1)
			size: [
				200
				200
			]
			properties:
				backgroundColor: "hsl(" + (i * 360 / 10) + ", 100%, 50%)"
				lineHeight: "200px"
				textAlign: "center"
		)
		i++
	renderController.show surfaces[0]
	Engine.on "click", (->
		next = (counter++ + 1) % surfaces.length
		@show surfaces[next]
		return
	).bind(renderController)
	mainContext.add(new Modifier(origin: [
		.5
		.5
	])).add renderController
	return

Template.tile.rendered = ->
	# createTile()
	
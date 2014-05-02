# Template.battle.wallsTest = () ->

# 	ease =
# 		duration: 400
# 		curve: Easing.inOutQuad

# 	context = Engine.createContext()
# 	surfaces = []
# 	gridNodes = []
# 	grid = new GridLayout(dimensions: [
# 		1
# 		4
# 	])
# 	grid.sequenceFrom gridNodes
# 	animateSurfaces = (transition, delay) ->
# 		transition = (if typeof transition isnt "undefined" then transition else ease)
# 		delay = (if typeof delay isnt "undefined" then delay else 200)
# 		i = 0

# 		while i < surfaces.length
# 			surface = surfaces[i]
# 			animate = (->
# 				if @visible
# 					@state.halt()
# 					@state.setOpacity 0, ease
# 				else
# 					@state.halt()
# 					@state.setOpacity 1, ease
# 				@visible = not @visible
# 				return
# 			).bind(surface)
# 			Timer.setTimeout animate, delay * i
# 			i++
# 		return

# 	i = 0

# 	while i < 4
# 		surface = new Surface(
# 			size: [
# 				100
# 				100
# 			]
# 			properties:
# 				backgroundColor: "hsl(" + (i * 360 / 8) + ", 100%, 50%)"
# 		)
# 		surface.state = new StateModifier()
# 		surface.visible = true
# 		node = new RenderNode()
# 		node.add(surface.state).add surface
# 		surfaces.push surface
# 		gridNodes.push node
# 		surface.on "click", animateSurfaces
# 		i++
# 	context.add(new StateModifier(
# 		size: [
# 			100
# 			400
# 		]
# 		origin: [
# 			0.5
# 			0.5
# 		]
# 	)).add grid


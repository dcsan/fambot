

Router.map ->
	@route "home",
		path: "/"
		data: ->
			units: allUnits[1..5]
			# units: allUnits
			msg: "all units"

	@route "unit",
		path: "/units/:cname"
		data: ->
			params: @params
			cname: @params.cname

	@route "battle",
		path: "/battle"
		data: ->
			units: allUnits
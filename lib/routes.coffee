Router.map ->
	@route "home",
		path: "/"

	@route "unit",
		path: "/units/:cname"
		data: ->
			params: @params
			cname: @params.cname

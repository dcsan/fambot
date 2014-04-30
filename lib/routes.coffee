Router.map ->
	@route "home",
		path: "/"
		data: ->
			units: [
				'thetoy'
				'u1r1cb'
				'u1r1cg'
				'u1r1cr'
				'u1r1cy'
				'u1r2cb'
				'u1r2cg'
				'u1r2cr'
				'u1r2cy'
				'u2r1cb'
				'u2r1cg'
				'u2r1cr'
				'u2r1cy'
				'u3r1cb'
				'u3r1cg'
				'u3r1cr'
				'u3r1cy'
				'u4r1cb'
				'u4r1cg'
				'u4r1cr'
				'u4r1cy'
				'u5r1cb'
				'u5r1cg'
				'u5r1cr'
				'u5r1cy'
			]
			msg: "all units"

	@route "unit",
		path: "/units/:cname"
		data: ->
			params: @params
			cname: @params.cname
Template.home.greeting = () ->
	return "welcome back"

Template.home.events =
	"click #btn1": (event) ->
		msg = "click btn1"
		console.log msg
		return msg

	"click #tile": (event) ->
		msg = "click tile"
		console.log msg
		return msg

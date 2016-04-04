# scripts/Imaisan.coffee
module.exports = (robot) ->
	robot.hear /今井さん$/i, (msg) ->
		msg.send "はい、今井です"

	robot.hear /Timaiさん$/i, (msg) ->
		msg.send "はーい、Timaiだよ"
# scripts/Imaisan.coffee

cron = require('cron').CronJob

module.exports = (robot) ->
	new cron '* * * * * *', () =>
    	robot.send {room:"#bot_test"}, "ねえねえ吉田くん吉田くん", null, true, "Asia/Tokyo"

	robot.hear /今井さん$/i, (msg) ->
		msg.send "はい、今井です"

	robot.hear /.*Timai.*/, (msg) ->
		msg.send "はーい、Timaiだよ"

	robot.hear /.*渋谷駅.*/, (msg) ->
		msg.send "いつも当駅をご利用いただき誠にありがとうございます"


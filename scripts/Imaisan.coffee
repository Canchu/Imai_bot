# scripts/Imaisan.coffee

cron = require('cron').CronJob

module.exports = (robot) ->
	cron = new cron('00 00 10-19 * * *', () =>
    	robot.send {room: "bot_test"}, "@yoshida ねえねえ吉田くん吉田くん　暇だよねえ？"
    )
    cron.start()

	robot.hear /今井さん$/i, (msg) ->
		msg.send "はい、今井です"

	robot.hear /.*Timai.*/, (msg) ->
		msg.send "はーい、Timaiだよ"

	robot.hear /.*渋谷駅.*/, (msg) ->
		msg.send "いつも当駅をご利用いただき誠にありがとうございます"


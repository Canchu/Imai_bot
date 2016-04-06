# scripts/Imaisan.coffee

cron = require('cron').CronJob
input_txt = ""
output_txt = ""

module.exports = (robot) ->

	cron = new cron('00 00 10-19 * * *', () =>
    	robot.send {room: "bot_test"}, "@yoshida ねえねえ吉田くん吉田くん　暇だよねえ？"
    )
    cron.start()

	robot.hear /今井さん$/, (msg) ->
		msg.send "はい、今井です"

	robot.hear /.*Timai.*/, (msg) ->
		msg.send "はーい、Timaiだよ"

	robot.hear /.*渋谷駅.*/, (msg) ->
		msg.send "いつも当駅をご利用いただき誠にありがとうございます"

	robot.hear input_txt, (msg) ->
		msg.send output_txt

	robot.hear /@imai input:.* output:.*/,(msg)->
		text = msg.match[0]
		split_txt = text.split(' ')
		input_txt  = split_txt[1].split(':')[1]
		output_txt = split_txt[2].split(':')[1]
		
		msg.send "俺にこんなん喋らすのwwww"

	


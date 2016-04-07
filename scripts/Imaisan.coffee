# scripts/Imaisan.coffee

cron = require('cron').CronJob
user_input = new RegExp();

module.exports = (robot) ->

	robot.brain.set('count', 0)

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


	robot.hear user_input, (msg) ->
		match_message = msg.message.text.match user_input
		output = robot.brain.get(match_message[0])
		msg.send output if output != null
	 	
	robot.hear /@imai input:.* output:.*/,(msg)->
		cnt = robot.brain.get('count')
		text = msg.match[0]
		split_txt = text.split(' ')
		input_txt  = split_txt[1].split(':')[1]
		output_txt = split_txt[2].split(':')[1]
		
		robot.brain.set(cnt + 'input_txt', input_txt)
		robot.brain.set(input_txt, output_txt)
		
		reg = ""
		while cnt >= 0
			reg += '.*' + robot.brain.get(cnt + 'input_txt') + '.*|'
			cnt--

		cnt = robot.brain.get('count')
		cnt++

		user_input = new RegExp(reg)	
		robot.brain.set('count', cnt)

		msg.send "んーとね…俺にこんなん喋らすのwwww"

	


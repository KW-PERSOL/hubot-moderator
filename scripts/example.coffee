# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

# us = require 'underscore'
# module.exports = (robot) ->
#   robot.hear /朝会の司会/i, (res) ->
#     request = require('request')
#     request.get
#       url: "https://slack.com/api/users.list?token=#{process.env.HUBOT_SLACK_TOKEN}",
#       (err, response, body) ->
#         members = (member_raw["name"] \
#           for member_raw in JSON.parse(body)["members"])
#           res.send "#{us.sample(members)}さんが選ばれました"
# https://slack.com/api/users.list?token=xoxp-31253277299-31735736007-431177065009-e70f0358d4b46913313a380ceaefdbcc

# TRチームのメンバーリスト
# TODO: SlackAPIから取得できるようにしたい
list = [
  '@shinya.kajino : 梶野'
  '@gotsu : 合津：',
  '@Ryo Sakaoka : 坂岡',
  '@Hiroshi Takeda : 竹田',
  '@Satsuki Tanaka : 田中',
  '@Akihiko Tsugawa : 津川',
  '@Makoto Suzuki : 鈴木',
  '@satoshi : 増田',
  '@jun.minagawa : 皆川',
  '@masaki.mori : 森',
  '<@U0XMMMN07> : 渡辺',
]

sentences = [
  'さん、お願いします！',
  'さんが選ばれました',
  'さんなんていかがでしょう',
  'さん、いってみよう！',
]

list_target = []

module.exports = (robot) ->

  target = ''

  robot.hear /朝会の司会/i, (res) ->
    list_target = list
    sentence_target = sentences

    target = res.random list_target
    sentence = res.random sentence_target
    res.send target + sentence

  robot.hear /もう一回/i, (res) ->
    list_target = list
    sentence_target = sentences

    target = res.random list_target
    sentence = res.random sentences
    res.send "もう一回！" + target + sentence

  robot.hear /リスト/i, (res) ->
    res.send list_target
    res.send list

  # robot.hear /badger/i, (res) ->
  #   res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  # robot.respond /open the (.*) doors/i, (res) ->
  #   doorType = res.match[1]
  #   if doorType is "pod bay"
  #     res.reply "I'm afraid I can't let you do that."
  #   else
  #     res.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'

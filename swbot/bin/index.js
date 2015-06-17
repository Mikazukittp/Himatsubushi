var app = require('../app');
var Twit = require('twit');
var CronJob = require("cron").CronJob;
var moment = require('moment');
//var http = require('http');

var T = new Twit({
  consumer_key: app.get('options').key,
  consumer_secret: app.get('options').secret,
  access_token: app.get('options').token,
  access_token_secret: app.get('options').token_secret
});

var cronTime = '0 0 * * * *';

new CronJob({
  cronTime: cronTime,
  onTick: function () {
    tweet();
  },
  start: true
});

function tweet(){
  //var message = moment().utc().add(9, 'h').format("ただいま MM月DD日 HH時mm分です。");
  var message = "フォースと共にあれ";
  console.log(message);

  T.post('statuses/update', { status: message }, function(err, data, response) {
    console.log('Tweet!');
  });
}

// var stream = T.stream('statuses/filter', { track: 'STAR WARS' })
var stream = T.stream('statuses/filter', { track: 'スターウォーズ' })
stream.on('tweet', function (tweet) {
    //console.log(tweet);
    console.log('@%s : %s (%s)', tweet.user.screen_name, tweet.text, tweet.id_str);
    console.log('https://twitter.com/%s/status/%s', tweet.user.screen_name, tweet.id_str);
})

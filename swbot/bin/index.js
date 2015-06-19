var app = require('../app');
var Twit = require('twit');
var CronJob = require("cron").CronJob;
var moment = require('moment');
//var http = require('http');
var request = require('request');
var QUESTIONS_URL = 'http://ec2-52-68-159-188.ap-northeast-1.compute.amazonaws.com/api/v1/questions/';
var NARUTO_MESSAGE = ' NARUTO展最高だってばよ！ NARUTOの問題を集めたアプリが公開されているよ！もしandroidを持っていたら是非試してみてね！ https://goo.gl/An4pUW'
var STARWARS_MESSAGE = ' STAR WARS展いいですね！ STAR WARSの問題を集めたアプリが公開されています！もしandroidを持っていたら是非試してみてね！ https://goo.gl/B0hZuz'



// アカウント設定
var T = new Twit({
  consumer_key: app.get('options').key,
  consumer_secret: app.get('options').secret,
  access_token: app.get('options').token,
  access_token_secret: app.get('options').token_secret
});


/****************************
 *
 * 定時で問題をつぶやく処理の記述
 *
 ****************************/

// 毎時0分にNARUTO、20分にSTAR WARS、40分にONE PIECEの問題をランダムでつぶやく
var cron1 = '0 0 * * * *';
new CronJob({
  cronTime: cron1,
  onTick: function () { getMangaQuestion(1, tweet); },
  start: true
});
var cron2 = '0 20 * * * *';
new CronJob({
  cronTime: cron2,
  onTick: function () { getMangaQuestion(2, tweet); },
  start: true
});
var cron3 = '0 40 * * * *';
new CronJob({
  cronTime: cron3,
  onTick: function () { getMangaQuestion(3, tweet); },
  start: true
});


// tweetメソッド
function tweet(message){
  //var message = moment().utc().add(9, 'h').format("ただいま MM月DD日 HH時mm分です。");
  T.post('statuses/update', { status: message }, function(err, data, response) {
    console.log('Post: %s', message);
  });
}

// 漫画の問題をランダム取得するメソッド
var getMangaQuestion = function(mangaId, cb){
  request(QUESTIONS_URL+mangaId, function (error, response, body) {
    if (!error && response.statusCode == 200) {
      cb(JSON.parse(body).question_array[0].sentence);
    } else {
      console.log('error: '+ response.statusCode);
    }
  });
};


/****************************************************
 *
 * publicタイムラインから特定の文字を拾って反応する処理の記述
 *
 ****************************************************/

// スターウォーズ展とつぶやかれたら
var swStream = T.stream('statuses/filter', { track: ['スターウォーズ展', 'スター・ウォーズ展', 'STAR WARS展', 'STARWARS展', 'star wars展', 'starwars展', 'Star wars展', 'Starwars展'] });
swStream.on('tweet', function (tweet) {
  T.post('statuses/update', { status: '@'+tweet.user.screen_name+STARWARS_MESSAGE }, function(err, data, response) {
    console.log('Post: %s', message);
  });
  console.log('@%s : %s (%s)', tweet.user.screen_name, tweet.text, tweet.id_str);
  console.log('https://twitter.com/%s/status/%s', tweet.user.screen_name, tweet.id_str);
});

// ナルト展とつぶやかれたら
var narutoStream = T.stream('statuses/filter', { track: ['ナルト展', 'NARUTO展'] });
narutoStream.on('tweet', function (tweet) {
  T.post('statuses/update', { status: '@'+tweet.user.screen_name+NARUTO_MESSAGE }, function(err, data, response) {
    console.log('Post: %s', message);
  });
  console.log('@%s : %s (%s)', tweet.user.screen_name, tweet.text, tweet.id_str);
  console.log('https://twitter.com/%s/status/%s', tweet.user.screen_name, tweet.id_str);
});

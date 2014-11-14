var express = require("express");
var redis = require("redis");
var RedisStore = require("connect-redis")(express);
var app = express();
var server = require("http").createServer(app);

app.configure(function(){
    app.use(express.cookieParser('blaaa'));
    app.use(express.session({
        store: new RedisStore({
            host: process.env.REDIS_HOST || 'localhost',
            port: process.env.REDIS_POST || 6379,
            db: process.env.REDIS_DB || 0
        }),
        cookie: {
            expires: false,
            maxAge: 30*24*60*60*1000
                }
    }));
});


app.get("/", function(req, res){
    res.json({status:"ok"});
});

var port = process.env.HTTP_PORT || 3000;
server.listen(port);
console.log("Server is running and listening on: " + port);


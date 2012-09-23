###
Module dependencies.
###

# mongooseAuth = require 'mongoose-auth'
everyauth = require 'everyauth'
user = require './models/user'
mongoose = require 'mongoose'
express = require 'express'
http = require 'http'
path = require 'path'

app = express()
port = process.env.PORT or 3000

fb = everyauth.facebook
fb.mobile true
fb.appId '121264304688657'
fb.appSecret 'e013be2b4d7b688eb25a69c77ad3159d'
fb.entryPath '/auth/facebook'
fb.callbackPath '/auth/facebook/callback'
fb.fields 'id,name,picture'
fb.findOrCreateUser (session, accessToken, accessTokenExtra, fbUserMetadata) ->
  info = fbUserMetadata
  user.findUser info.id, (found) ->
    if not found
      return user.addUser info
fb.redirectPath '/'

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', path.join __dirname, 'views'
  app.set 'view engine', 'jade'
  app.use require('stylus').middleware 
    src: path.join __dirname, 'public' 
  app.use express.static(path.join __dirname, 'public')
  app.use express.cookieParser()
  app.use express.session 'secret': 'rddalym'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use everyauth.middleware app
  # app.use mongooseAuth.middleware()

# app.configure 'development', ->
#   mongoose.connect 'mongodb://localhost:27017/myladdr'
#   app.use express.errorHandler
#     dumpExceptions: true
#     showStack: true

# app.configure 'production', ->
  mongoUrl = 'mongodb://managr:h0wi5tH1sX@ds035787-a.mongolab.com:35787/myladdr'
  app.use express.errorHandler()
  mongoose.connect mongoUrl

routes = require './routes'
profile = require './routes/profile'

app.get '/home', routes.index
app.get '/profile', profile.index
app.post '/newuser', profile.newuser

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get 'port'

module.exports = app
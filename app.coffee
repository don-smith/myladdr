###
Module dependencies.
###

mongoose = require 'mongoose'
express = require 'express'
http = require 'http'
path = require 'path'
app = express()

routes = require './routes'
profile = require './routes/profile'

app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger 'dev' 
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use require('stylus').middleware __dirname + '/public' 
  app.use express.static(path.join __dirname, 'public')
  mongoose.connect 'mongodb://managr:h0wi5tH1sX@ds035787-a.mongolab.com:35787/myladdr'

app.configure 'development', ->
  app.use express.errorHandler()
  mongoose.connect 'mongodb://localhost:27017/myladdr'

app.get '/', routes.index
app.get '/profile', profile.index

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')


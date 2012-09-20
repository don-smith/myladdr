mongooseAuth = require 'mongoose-auth'
mongoose = require 'mongoose'
Schema = mongoose.Schema

UserSchema = new Schema
	fullname: String
	isActive: Boolean
	isAdmin: Boolean

UserSchema.plugin mongooseAuth,
	everymodule:
		everyauth:
			User: ->
				return User
	facebook: 
		everyauth:
			myHostname: 'http://localhost:3000'
			appId: ''
			appSecret: ''
			redirectPath: '/'

User = mongoose.model 'User', UserSchema

module.exports = 

	user: User,

	add: (fullname) ->
		newUser = new User
			fullname: fullname
			isActive: false
			isAdmin: false
		newUser.save (err) ->
			if err 
				throw err



# mongooseAuth = require 'mongoose-auth'
everyauth = require 'everyauth'
mongoose = require 'mongoose'
Schema = mongoose.Schema

UserSchema = new Schema
	fbId: String
	fbName: String
	isActive: Boolean
	isAdmin: Boolean

User = mongoose.model 'User', UserSchema

module.exports = 

	user: User,

	findUser: (id, callback) -> 
		if not id 
			return
		User.findOne {'fbId': id}, 'fullname isAdmin', (err, user) ->
			callback user

	addUser : (user) -> 
		newUser = new User()
		newUser.fbId = user.id
		newUser.fbName = user.name
		newUser.isAdmin = false
		newUser.isActive = false
		newUser.save() 
		return user.id

	add: (fullname) ->
		newUser = new User
			fullname: fullname
			isActive: false
			isAdmin: false
		newUser.save (err) ->
			if err 
				throw err



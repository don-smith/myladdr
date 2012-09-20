mongoose = require 'mongoose'
Schema = mongoose.Schema

ProfileSchema = new Schema
	fullname: String,
	isActive: Boolean

Profile = mongoose.model 'ProfileModel', ProfileSchema

module.exports = 

	profile: Profile,
	
	add: (fullname) ->
		newProfile = new Profile
			fullname: fullname,
			isActive: false
		newProfile.save (err) ->
			if err 
				throw err



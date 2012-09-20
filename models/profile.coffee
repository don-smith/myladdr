mongoose = require 'mongoose'
Schema = mongoose.Schema

ProfileSchema = new Schema
	username: String,
	isActive: Boolean

module.exports = mongoose.model 'ProfileModel', ProfileSchema
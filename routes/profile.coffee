profile = require '../models/profile'

module.exports = 

	index: (req, res) ->
	  res.render 'profile',
	  	title: 'Profile',
	  	details: {}

	newuser: (req, res) ->
		profile.add req.params.fullname
		res.redirect '/profile'

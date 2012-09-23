user = require '../models/user'

module.exports = 

	index: (req, res) ->
		res.render 'profile',
			title: 'Profile',
			fullname: user.fullname

	newuser: (req, res) ->
		user.add req.body.fullname
		res.redirect '/profile'

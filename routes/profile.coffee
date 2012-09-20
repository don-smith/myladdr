user = require '../models/user'

module.exports = 

	index: (req, res) ->
		res.render 'profile',
			title: 'Profile',
			fullname: req.params.fullname

	newuser: (req, res) ->
		user.add req.params.fullname
		res.redirect '/profile'

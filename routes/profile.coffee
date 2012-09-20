
#
# * GET user's profile
# 
exports.index = (req, res) ->
  res.render 'profile',
  	title: 'Profile',
  	details: {}

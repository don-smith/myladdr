expect = require('chai').expect
routes = require '../routes/index'
profile = require '../routes/profile'

describe 'routes', ->
	describe 'index', ->
		it 'should display the home page', ->
			req = null
			res = 
				render: (view, vars) ->
					expect(view).to.equal 'index'
					expect(vars.title).to.equal 'myLaddr Home'
			routes.index req, res

	describe 'profile', ->
		it 'should display the profile page', ->
			req = null
			res = 
				render: (view, vars) ->
					expect(view).to.equal 'profile'
					expect(vars.title).to.equal 'Profile'
			profile.index req, res

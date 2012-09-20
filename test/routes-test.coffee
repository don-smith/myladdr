expect = require('chai').expect
routes = require '../routes/index'
profile = require '../routes/profile'

describe 'routes', ->
	describe 'index', ->
		it 'should display the home page', (done) ->
			req = null
			res = 
				render: (view, vars) ->
					expect(view).to.equal 'index'
					expect(vars.title).to.equal 'myLaddr Home'
					done()
			routes.index req, res

	describe 'profile', ->
		it 'should display the profile page', (done) ->
			req = null
			res = 
				render: (view, vars) ->
					expect(view).to.equal 'profile'
					expect(vars.title).to.equal 'Profile'
					done()
			profile.index req, res

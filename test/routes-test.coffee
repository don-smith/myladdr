expect = require('chai').expect
routes = require '../routes/index'

describe 'routes', ->
	describe 'index', ->
		it 'should display the player\'s profile', ->
			req = null
			res = 
				render: (view, vars) ->
					expect(view).to.equal 'index'
					expect(vars.title).to.equal 'myLaddr Profile'
			routes.index req, res

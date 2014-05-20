require 'test/unit'
require 'rack/test'
require 'sinatra'
require 'coveralls'
require 'codeclimate-test-reporter'
require_relative '../main'
CodeClimate::TestReporter.start
Coveralls.wear!

class MyTest < Test::Unit::TestCase
	def test_example
		assert_equal(1, 1)
	end

	def test_my_default
		get '/'
		assert_equal 'bar', last_response.body
	end
end

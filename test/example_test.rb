require 'test/unit'
require 'coveralls'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
Coveralls.wear!

class MyTest < Test::Unit::TestCase
	def test_example
		assert_equal(1, 1)
	end
end

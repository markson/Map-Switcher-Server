require 'test/unit'
Coveralls.wear!

class MyTest < Test::Unit::TestCase
	def test_example
		assert_equal(1, 1)
	end
end
require "minitest/autorun"
require_relative "ExecUtil"

class TestExecUtil < Minitest::Test
	def setup
	end

	def teardown
	end

	def test_execCmd
		puts "test_execCmd"
		assert_equal true, ExecUtil.execCmd("/bin/sh -c 'echo !test_execCmd'")
		assert_equal true, ExecUtil.execCmd("/bin/sh -c 'echo !test_execCmd'", ".", false)
	end

	def test_hasResult
		puts "test_hasResult"
		assert_equal true, ExecUtil.hasResult?("/bin/sh -c 'echo !test_hasResult'")
		assert_equal false, ExecUtil.hasResult?("/bin/sh -c ''")
	end
end
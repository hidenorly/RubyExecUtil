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

	def test_getExecResultEachLine
		puts "test_getExecResultEachLine"
		assert_equal ["Ok"], ExecUtil.getExecResultEachLine("/bin/sh -c 'echo Ok'")
		assert_equal ["1", "2"], ExecUtil.getExecResultEachLine("/bin/sh -c 'echo \"1\"; echo \"2\"'")
	end
end
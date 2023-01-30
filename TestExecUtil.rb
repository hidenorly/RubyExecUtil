require "minitest/autorun"
require_relative "ExecUtil"

class TestExecUtil < Minitest::Test
	def setup
		@shPath = "/bin/sh"
		result = ExecUtil.getExecResultEachLine("which sh")
		@shPath = result[0] if !result.empty?
	end

	def teardown
	end

	def test_execCmd
		puts "test_execCmd"
		assert_equal true, ExecUtil.execCmd("#{@shPath} -c 'echo !test_execCmd'")
		assert_equal true, ExecUtil.execCmd("#{@shPath} -c 'echo !test_execCmd'", ".", false)
	end

	def test_hasResult
		puts "test_hasResult"
		assert_equal true, ExecUtil.hasResult?("#{@shPath} -c 'echo !test_hasResult'")
		assert_equal false, ExecUtil.hasResult?("#{@shPath} -c ''")
	end

	def test_getExecResultEachLine
		puts "test_getExecResultEachLine"
		assert_equal ["Ok"], ExecUtil.getExecResultEachLine("#{@shPath} -c 'echo Ok'")
		assert_equal ["1", "2"], ExecUtil.getExecResultEachLine("#{@shPath} -c 'echo \"1\"; echo \"2\"'")
	end
end
require 'test/unit'
require_relative 'string_judger.rb'

# test the string judger class
class StringJudgerTest < Test::Unit::TestCase
  def test_input
    input = "aaa\nab" # shortest nice followed by shortest naughty
    assert_equal 1, StringJudger.new.judge_input(input)
  end
end

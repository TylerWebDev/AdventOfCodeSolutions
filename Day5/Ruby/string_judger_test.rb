require 'test/unit'
require_relative 'string_judger.rb'
require 'pry'

# test the string judger class
class StringJudgerTest < Test::Unit::TestCase
  def test_input
    sj = StringJudger.new
    input = "qjhvhtzxzqqjkmpb\nxxyxx\nuurcxstgmygtbstg\nieodomkazucvgmuy\nmmggfwapsetemiuj"
    assert_equal 2, sj.judge_input(input)
  end

  def test_input_legacy
    input = "aaa\nab" # shortest nice followed by shortest naughty - legacy
    assert_equal 1, StringJudger.new.legacy_judge_input(input)
  end
end

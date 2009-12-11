require 'helper'

class Dummy
  def one_arg(foo); end
  def multiple_args(foo, bar, baz); end
  def optional_args(foo, bar = 1, baz = nil); end
  def star_args(*foo); end
end

class TestGetArgs < Test::Unit::TestCase
  def test_get_args
    assert_equal [[[:foo]], []], Dummy.instance_method(:one_arg).get_args
    assert_equal [[[:foo], [:bar], [:baz]], []], Dummy.instance_method(:multiple_args).get_args
    assert_equal [[[:foo], [:bar, 1], [:baz, nil]], [:bar, :baz]], Dummy.instance_method(:optional_args).get_args
    assert_equal [[[%s[*foo]]], []], Dummy.instance_method(:star_args).get_args
  end
end

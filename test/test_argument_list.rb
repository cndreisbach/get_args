require 'helper'

class Dummy
  def one_arg(foo); end
  def multiple_args(foo, bar, baz); end
  def optional_args(foo, bar = 1, baz = nil); end
  def star_args(*foo); end
end

class TestArgumentList < Test::Unit::TestCase
  def test_one_arg
    list = Dummy.instance_method(:one_arg).get_argument_list
    assert_equal 1, list.length
    assert_equal :foo, list.first.name
    assert !list.first.optional?
  end
  
  def test_multiple_args
    list = Dummy.instance_method(:multiple_args).get_argument_list
    assert_equal 3, list.length
  end
  
  def test_optional_args
    list = Dummy.instance_method(:optional_args).get_argument_list

    assert !list[0].optional?
    assert list[1].optional?
    assert_equal 1, list[1].default
    assert list[2].optional?
    assert_equal nil, list[2].default    
  end
  
  def test_star_args
    list = Dummy.instance_method(:star_args).get_argument_list
    
    assert list.first.multiple?
  end
  
end
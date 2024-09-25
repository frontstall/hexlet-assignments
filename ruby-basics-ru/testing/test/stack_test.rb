# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def test_transforming_to_array
    empty_array = []
    stack = Stack.new
    assert_equal stack.to_a, empty_array

    array = [1, 'a', {}]
    stack = Stack.new array
    assert_equal stack.to_a, array
  end

  def test_that_stack_is_empty
    stack = Stack.new
    assert(stack.empty?)
  end

  def test_that_stack_is_not_empty
    stack = Stack.new [1, 'a', {}]
    refute(stack.empty?)
  end

  def test_stack_size
    stack = Stack.new [1, 'a', {}]
    assert_equal stack.size, 3
  end

  def test_empty_stack_size
    stack = Stack.new
    assert_equal stack.size, 0
  end

  def test_elems_pushing
    stack = Stack.new
    stack.push! 1
    assert_equal stack.to_a, [1]

    stack.push! 'a'
    stack.push!({})
    assert_equal stack.to_a, [1, 'a', {}]
  end

  def test_elems_popping
    stack = Stack.new [1, 'a', {}]
    stack.pop!
    assert_equal stack.to_a, [1, 'a']

    stack.pop!
    stack.pop!
    assert_empty stack.to_a

    stack.pop!
    assert_empty stack.to_a
  end

  def test_stack_clearing
    stack = Stack.new [1, 'a', {}]
    stack.clear!
    assert_empty stack.to_a
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?

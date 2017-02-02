require './lib/date_night.rb'
require './lib/node.rb'
require_relative 'test_helper'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_returns_depth_when_inserted
    assert_equal 0, @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, @tree.insert(16, "Johnny English")
    assert_equal 2, @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_find_if_score_is_included
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")

    assert_equal true, @tree.include?(16)
  end

  def test_it_can_show_the_depth
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, @tree.depth_of(16)
    assert_equal 0, @tree.depth_of(61)
    assert_equal 2, @tree.depth_of(50)
  end

  def test_it_can_give_max_min
    assert_equal 0, @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, @tree.insert(16, "Johnny English")
    assert_equal 2, @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ({"Bill & Ted's Excellent Adventure"=>61}), @tree.max
    assert_equal ({"Johnny English"=>16}), @tree.min
  end
end
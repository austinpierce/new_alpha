require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
    # if this fails it's because the model doesn't exist
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
    # assert_not because category name should not be blank 
    # so this should not be valid
  end
  
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
    # can't have duplicate category name
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
    # name should not be greater than 25 characters
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
    # name should not be less than 3 characters
  end
  
end
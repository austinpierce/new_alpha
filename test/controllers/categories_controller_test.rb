require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Admin", email: "Admin@alpha.com", password: "password", admin: true)
  end
  
  test "should get categories index" do
    get categories_path
    assert_response :success
  end
  
  test "should get new" do
    sign_in_as(@user, "password") # simulates logged in user / from test_helper.rb
    get new_category_path
    assert_response :success
  end
  
  test "should get show" do
    get category_path(@category)
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    # this works because in the setup of this test page there is no logged in user
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name:"sports"}}
    end
    assert_redirected_to categories_path
  end
  
  
end
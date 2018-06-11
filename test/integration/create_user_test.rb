require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  
  test "user sign up" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user:{username: "TestUser", email: "TestUser@email.com", password: "123456"}}
      follow_redirect!
    end
    assert_template 'users/show'
    assert_select "h1", "Welcome to TestUser's profile"
  end
  
end
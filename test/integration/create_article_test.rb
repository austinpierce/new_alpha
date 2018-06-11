require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "User", email: "User@alpha.com", password: "password", admin: false)
  end
  
  test "user must be signed in to create article" do
    get new_article_path # attempt to reach new article form
    follow_redirect! # get re-directed to root_path
    assert_template root_path # validate user is at root_path
  end
  
  
  test "create new article" do
    sign_in_as(@user, "password") 
    # this didn't work before because no user was signed in
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article:{title: "Test Article", description: "This article is for an integration test"} }
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_select "h2", "Title: Test Article"
  end
  
end
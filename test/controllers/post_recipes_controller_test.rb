require 'test_helper'

class PostRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get post_recipes_show_url
    assert_response :success
  end

  test "should get new" do
    get post_recipes_new_url
    assert_response :success
  end

  test "should get edit" do
    get post_recipes_edit_url
    assert_response :success
  end

end

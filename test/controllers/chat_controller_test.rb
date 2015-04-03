require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get pub" do
    get :pub
    assert_response :success
  end

  test "should get sub" do
    get :sub
    assert_response :success
  end

end

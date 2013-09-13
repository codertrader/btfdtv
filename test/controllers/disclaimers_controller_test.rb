require 'test_helper'

class DisclaimersControllerTest < ActionController::TestCase
  setup do
    @disclaimer = disclaimers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disclaimers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disclaimer" do
    assert_difference('Disclaimer.count') do
      post :create, disclaimer: { description: @disclaimer.description, disclaimer: @disclaimer.disclaimer }
    end

    assert_redirected_to disclaimer_path(assigns(:disclaimer))
  end

  test "should show disclaimer" do
    get :show, id: @disclaimer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disclaimer
    assert_response :success
  end

  test "should update disclaimer" do
    patch :update, id: @disclaimer, disclaimer: { description: @disclaimer.description, disclaimer: @disclaimer.disclaimer }
    assert_redirected_to disclaimer_path(assigns(:disclaimer))
  end

  test "should destroy disclaimer" do
    assert_difference('Disclaimer.count', -1) do
      delete :destroy, id: @disclaimer
    end

    assert_redirected_to disclaimers_path
  end
end

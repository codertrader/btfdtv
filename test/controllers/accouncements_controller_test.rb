require 'test_helper'

class AccouncementsControllerTest < ActionController::TestCase
  setup do
    @accouncement = accouncements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accouncements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accouncement" do
    assert_difference('Accouncement.count') do
      post :create, accouncement: { ends_at: @accouncement.ends_at, message: @accouncement.message, starts_at: @accouncement.starts_at }
    end

    assert_redirected_to accouncement_path(assigns(:accouncement))
  end

  test "should show accouncement" do
    get :show, id: @accouncement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accouncement
    assert_response :success
  end

  test "should update accouncement" do
    patch :update, id: @accouncement, accouncement: { ends_at: @accouncement.ends_at, message: @accouncement.message, starts_at: @accouncement.starts_at }
    assert_redirected_to accouncement_path(assigns(:accouncement))
  end

  test "should destroy accouncement" do
    assert_difference('Accouncement.count', -1) do
      delete :destroy, id: @accouncement
    end

    assert_redirected_to accouncements_path
  end
end

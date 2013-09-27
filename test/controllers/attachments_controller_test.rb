require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  setup do
    @attachment = attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attachment" do
    assert_difference('Attachment.count') do
      post :create, attachment: { bytes: @attachment.bytes, icon: @attachment.icon, link: @attachment.link, name: @attachment.name, stream_id: @attachment.stream_id, thumbnails_200x200: @attachment.thumbnails_200x200, thumbnails_640x480: @attachment.thumbnails_640x480, thumbnails_64x64: @attachment.thumbnails_64x64 }
    end

    assert_redirected_to attachment_path(assigns(:attachment))
  end

  test "should show attachment" do
    get :show, id: @attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attachment
    assert_response :success
  end

  test "should update attachment" do
    patch :update, id: @attachment, attachment: { bytes: @attachment.bytes, icon: @attachment.icon, link: @attachment.link, name: @attachment.name, stream_id: @attachment.stream_id, thumbnails_200x200: @attachment.thumbnails_200x200, thumbnails_640x480: @attachment.thumbnails_640x480, thumbnails_64x64: @attachment.thumbnails_64x64 }
    assert_redirected_to attachment_path(assigns(:attachment))
  end

  test "should destroy attachment" do
    assert_difference('Attachment.count', -1) do
      delete :destroy, id: @attachment
    end

    assert_redirected_to attachments_path
  end
end

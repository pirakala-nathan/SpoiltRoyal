require 'test_helper'

class PersonalInfosControllerTest < ActionController::TestCase
  setup do
    @personal_info = personal_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_info" do
    assert_difference('PersonalInfo.count') do
      post :create, personal_info: { email: @personal_info.email, legal_first_name: @personal_info.legal_first_name, legal_last_name: @personal_info.legal_last_name, preferred_name: @personal_info.preferred_name, primary_phone: @personal_info.primary_phone, secondary_phone: @personal_info.secondary_phone, title: @personal_info.title, vendor_id: @personal_info.vendor_id }
    end

    assert_redirected_to personal_info_path(assigns(:personal_info))
  end

  test "should show personal_info" do
    get :show, id: @personal_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_info
    assert_response :success
  end

  test "should update personal_info" do
    patch :update, id: @personal_info, personal_info: { email: @personal_info.email, legal_first_name: @personal_info.legal_first_name, legal_last_name: @personal_info.legal_last_name, preferred_name: @personal_info.preferred_name, primary_phone: @personal_info.primary_phone, secondary_phone: @personal_info.secondary_phone, title: @personal_info.title, vendor_id: @personal_info.vendor_id }
    assert_redirected_to personal_info_path(assigns(:personal_info))
  end

  test "should destroy personal_info" do
    assert_difference('PersonalInfo.count', -1) do
      delete :destroy, id: @personal_info
    end

    assert_redirected_to personal_infos_path
  end
end

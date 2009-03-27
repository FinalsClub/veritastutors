require 'test_helper'

class AppointmentRequestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_request" do
    assert_difference('AppointmentRequest.count') do
      post :create, :appointment_request => { }
    end

    assert_redirected_to appointment_request_path(assigns(:appointment_request))
  end

  test "should show appointment_request" do
    get :show, :id => appointment_requests(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => appointment_requests(:one).id
    assert_response :success
  end

  test "should update appointment_request" do
    put :update, :id => appointment_requests(:one).id, :appointment_request => { }
    assert_redirected_to appointment_request_path(assigns(:appointment_request))
  end

  test "should destroy appointment_request" do
    assert_difference('AppointmentRequest.count', -1) do
      delete :destroy, :id => appointment_requests(:one).id
    end

    assert_redirected_to appointment_requests_path
  end
end

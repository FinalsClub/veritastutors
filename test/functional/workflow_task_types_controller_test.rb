require 'test_helper'

class WorkflowTaskTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workflow_task_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workflow_task_type" do
    assert_difference('WorkflowTaskType.count') do
      post :create, :workflow_task_type => { }
    end

    assert_redirected_to workflow_task_type_path(assigns(:workflow_task_type))
  end

  test "should show workflow_task_type" do
    get :show, :id => workflow_task_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workflow_task_types(:one).id
    assert_response :success
  end

  test "should update workflow_task_type" do
    put :update, :id => workflow_task_types(:one).id, :workflow_task_type => { }
    assert_redirected_to workflow_task_type_path(assigns(:workflow_task_type))
  end

  test "should destroy workflow_task_type" do
    assert_difference('WorkflowTaskType.count', -1) do
      delete :destroy, :id => workflow_task_types(:one).id
    end

    assert_redirected_to workflow_task_types_path
  end
end

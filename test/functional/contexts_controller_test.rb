require 'test_helper'

class ContextsControllerTest < ActionController::TestCase
  setup do
    @context = contexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create context" do
    assert_difference('Context.count') do
      post :create, context: { alias: @context.alias, display_name: @context.display_name }
    end

    assert_redirected_to context_path(assigns(:context))
  end

  test "should show context" do
    get :show, id: @context
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @context
    assert_response :success
  end

  test "should update context" do
    put :update, id: @context, context: { alias: @context.alias, display_name: @context.display_name }
    assert_redirected_to context_path(assigns(:context))
  end

  test "should destroy context" do
    assert_difference('Context.count', -1) do
      delete :destroy, id: @context
    end

    assert_redirected_to contexts_path
  end
end

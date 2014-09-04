require 'test_helper'

class KittensControllerTest < ActionController::TestCase
  setup do
    @kitten = kittens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kittens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kitten" do
    assert_difference('Kitten.count') do
      post :create, kitten: { age: @kitten.age, cuteness: @kitten.cuteness, name: @kitten.name, softness: @kitten.softness }
    end

    assert_redirected_to kitten_path(assigns(:kitten))
  end

  test "should show kitten" do
    get :show, id: @kitten
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kitten
    assert_response :success
  end

  test "should update kitten" do
    patch :update, id: @kitten, kitten: { age: @kitten.age, cuteness: @kitten.cuteness, name: @kitten.name, softness: @kitten.softness }
    assert_redirected_to kitten_path(assigns(:kitten))
  end

  test "should destroy kitten" do
    assert_difference('Kitten.count', -1) do
      delete :destroy, id: @kitten
    end

    assert_redirected_to kittens_path
  end
end

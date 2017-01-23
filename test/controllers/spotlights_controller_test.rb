require 'test_helper'

class SpotlightsControllerTest < ActionController::TestCase
  setup do
    @spotlight = spotlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spotlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spotlight" do
    assert_difference('Spotlight.count') do
      post :create, spotlight: { description: @spotlight.description, description_title: @spotlight.description_title, icon: @spotlight.icon, publisher: @spotlight.publisher, title: @spotlight.title }
    end

    assert_redirected_to spotlight_path(assigns(:spotlight))
  end

  test "should show spotlight" do
    get :show, id: @spotlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spotlight
    assert_response :success
  end

  test "should update spotlight" do
    patch :update, id: @spotlight, spotlight: { description: @spotlight.description, description_title: @spotlight.description_title, icon: @spotlight.icon, publisher: @spotlight.publisher, title: @spotlight.title }
    assert_redirected_to spotlight_path(assigns(:spotlight))
  end

  test "should destroy spotlight" do
    assert_difference('Spotlight.count', -1) do
      delete :destroy, id: @spotlight
    end

    assert_redirected_to spotlights_path
  end
end

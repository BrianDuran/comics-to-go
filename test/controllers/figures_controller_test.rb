require 'test_helper'

class FiguresControllerTest < ActionController::TestCase
  setup do
    @figure = figures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:figures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create figure" do
    assert_difference('Figure.count') do
      post :create, figure: { character_id: @figure.character_id, name: @figure.name, release_date: @figure.release_date }
    end

    assert_redirected_to figure_path(assigns(:figure))
  end

  test "should show figure" do
    get :show, id: @figure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @figure
    assert_response :success
  end

  test "should update figure" do
    patch :update, id: @figure, figure: { character_id: @figure.character_id, name: @figure.name, release_date: @figure.release_date }
    assert_redirected_to figure_path(assigns(:figure))
  end

  test "should destroy figure" do
    assert_difference('Figure.count', -1) do
      delete :destroy, id: @figure
    end

    assert_redirected_to figures_path
  end
end

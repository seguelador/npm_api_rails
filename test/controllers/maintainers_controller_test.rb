require "test_helper"

class MaintainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintainer = maintainers(:one)
  end

  test "should get index" do
    get maintainers_url
    assert_response :success
  end

  test "should get new" do
    get new_maintainer_url
    assert_response :success
  end

  test "should create maintainer" do
    assert_difference('Maintainer.count') do
      post maintainers_url, params: { maintainer: { name: @maintainer.name, references: @maintainer.references } }
    end

    assert_redirected_to maintainer_url(Maintainer.last)
  end

  test "should show maintainer" do
    get maintainer_url(@maintainer)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintainer_url(@maintainer)
    assert_response :success
  end

  test "should update maintainer" do
    patch maintainer_url(@maintainer), params: { maintainer: { name: @maintainer.name, references: @maintainer.references } }
    assert_redirected_to maintainer_url(@maintainer)
  end

  test "should destroy maintainer" do
    assert_difference('Maintainer.count', -1) do
      delete maintainer_url(@maintainer)
    end

    assert_redirected_to maintainers_url
  end
end

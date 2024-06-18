require "test_helper"

class ChartTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chart_type = chart_types(:one)
  end

  test "should get index" do
    get chart_types_url
    assert_response :success
  end

  test "should get new" do
    get new_chart_type_url
    assert_response :success
  end

  test "should create chart_type" do
    assert_difference("ChartType.count") do
      post chart_types_url, params: { chart_type: { chart_format: @chart_type.chart_format, chart_settings: @chart_type.chart_settings, name: @chart_type.name } }
    end

    assert_redirected_to chart_type_url(ChartType.last)
  end

  test "should show chart_type" do
    get chart_type_url(@chart_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_chart_type_url(@chart_type)
    assert_response :success
  end

  test "should update chart_type" do
    patch chart_type_url(@chart_type), params: { chart_type: { chart_format: @chart_type.chart_format, chart_settings: @chart_type.chart_settings, name: @chart_type.name } }
    assert_redirected_to chart_type_url(@chart_type)
  end

  test "should destroy chart_type" do
    assert_difference("ChartType.count", -1) do
      delete chart_type_url(@chart_type)
    end

    assert_redirected_to chart_types_url
  end
end

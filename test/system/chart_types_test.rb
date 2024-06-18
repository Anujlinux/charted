require "application_system_test_case"

class ChartTypesTest < ApplicationSystemTestCase
  setup do
    @chart_type = chart_types(:one)
  end

  test "visiting the index" do
    visit chart_types_url
    assert_selector "h1", text: "Chart types"
  end

  test "should create chart type" do
    visit chart_types_url
    click_on "New chart type"

    fill_in "Chart format", with: @chart_type.chart_format
    fill_in "Chart settings", with: @chart_type.chart_settings
    fill_in "Name", with: @chart_type.name
    click_on "Create Chart type"

    assert_text "Chart type was successfully created"
    click_on "Back"
  end

  test "should update Chart type" do
    visit chart_type_url(@chart_type)
    click_on "Edit this chart type", match: :first

    fill_in "Chart format", with: @chart_type.chart_format
    fill_in "Chart settings", with: @chart_type.chart_settings
    fill_in "Name", with: @chart_type.name
    click_on "Update Chart type"

    assert_text "Chart type was successfully updated"
    click_on "Back"
  end

  test "should destroy Chart type" do
    visit chart_type_url(@chart_type)
    click_on "Destroy this chart type", match: :first

    assert_text "Chart type was successfully destroyed"
  end
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
chart_names = %w[bar spline column pie]
default_chart_settings = { "yAxis" => {}, "xAxis" => {} }.to_json
default_chart_format = {
  "x_axis" => "single",
  "y_axis" => "single",
  "x_axis_format" => "titles",
  "y_axis_format" => "titles",
  "x_limit" => "4",
  "y_limit" => "2"
}

chart_names.each do |name|
  display_name = name.capitalize
  ChartType.create!(
    name: name,
    display_name: display_name,
    chart_settings: default_chart_settings,
    chart_format: default_chart_format
  )
end
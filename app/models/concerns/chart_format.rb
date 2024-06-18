# app/models/concerns/chart_format.rb
module ChartFormat
  extend ActiveSupport::Concern

  included do
    attribute :min_input, :integer, default: 2
    attribute :x_axis, :string, array: true, default: ["single", "multiple"]
    attribute :y_axis, :string, array: true, default: ["single", "multiple"]
    attribute :x_axis_format, :string, array: true, default: ["titles", "values"]
    attribute :y_axis_format, :string, array: true, default: ["titles", "values"]
    attribute :x_limit, :integer, default: 4
    attribute :y_limit, :integer, default: 2
  end

  def chart_format
    return self[:chart_format] if self[:chart_format].present?
    
    {
      min_input: min_input,
      x_axis: x_axis,
      y_axis: y_axis,
      x_axis_format: x_axis_format,
      y_axis_format: y_axis_format,
      x_limit: x_limit,
      y_limit: y_limit
    }
  end
end
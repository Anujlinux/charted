# app/services/chart_data_generator.rb
module ChartDataGenerator
  def self.chart_data(chart)
    # Call the appropriate method based on chart_type
    if chart.chart_data.class == Hash
      rows = chart.chart_data["rows"]
      columns = chart.chart_data["columns"]
    else
      rows = JSON.parse(chart.chart_data)["rows"]
      columns = JSON.parse(chart.chart_data)["columns"]
    end
    { title: chart.title,
      subtitle: chart.subtitle,
      chart_type: chart.chart_type.name,
      full_data: send("#{chart.chart_type.name.underscore}_data", rows, columns)
    }
  end

  private

  def self.spline_data(rows, columns)
    series_name = columns[1]
    series_data = rows.map { |row| [row[0].to_i, row[1].to_i] }

    {series: [{ name: series_name, data: series_data}], categories: []}
  end

  def self.line_data(rows, columns)
    series_name = columns[1]
    series_data = rows.map { |row| [row[0].to_i, row[1].to_i] }

    {series: [{ name: series_name, data: series_data}], categories: []}
  end

  def self.bar_data(rows, columns)
    categories = rows.map { |row| row[0] }
    series = columns[1..-1].map.with_index do |column_name, index|
      {
        name: column_name,
        data: rows.map { |row| row[index + 1].to_i }
      }
    end

    {categories: categories, series: series}
  end

  def self.column_data(rows, columns)
    categories = rows.map { |row| row[0] }
    series = columns[1..-1].map do |column_name|
      {
        name: column_name,
        data: rows.map { |row| row[columns.index(column_name)].to_i }
      }
    end

    {categories: categories, series: series}
  end

  def self.pie_data(rows, columns)
    series = [{
      data: rows.map do |row|
        {
          name: row[0],
          y: row[1].to_f
        }
      end
    }]

    {categories: [], series: series}
  end

  def self.funnel_data(rows, columns)
    series_name = columns[1]
    series_data = rows.map { |row| [row[0], row[1].to_f] }

    { series: [{ name: series_name, data: series_data }], categories: [] }
  end
end
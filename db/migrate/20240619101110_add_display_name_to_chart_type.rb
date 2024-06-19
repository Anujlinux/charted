class AddDisplayNameToChartType < ActiveRecord::Migration[7.1]
  def change
    add_column :chart_types, :display_name, :string
  end
end

class CreateChartTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :chart_types do |t|
      t.string :name
      t.json :chart_settings
      t.json :chart_format

      t.timestamps
    end
  end
end

class CreateCharts < ActiveRecord::Migration[7.1]
  def change
    create_table :charts do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.references :chart_type, null: false, foreign_key: true
      t.json :chart_data
      t.json :chart_settings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

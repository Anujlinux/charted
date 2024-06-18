class AddDataSourceTypeToChart < ActiveRecord::Migration[7.1]
  def change
    add_column :charts, :data_source_type, :integer
  end
end

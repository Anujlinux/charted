class Chart < ApplicationRecord
  belongs_to :chart_type
  belongs_to :user

  validates :title, :chart_type, presence: true

  enum data_source_type: {
    static_form_filled: 0,
    table_data: 1,
    database: 2,
    api: 3
  }
end

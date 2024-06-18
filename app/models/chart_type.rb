class ChartType < ApplicationRecord
  include ChartFormat

  has_many :charts

  validates :name, :chart_settings, presence: true
end

json.extract! chart, :id, :title, :subtitle, :description, :chart_type_id, :chart_data, :chart_settings, :user_id, :created_at, :updated_at
json.url chart_url(chart, format: :json)

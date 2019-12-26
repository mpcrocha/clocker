json.extract! clock_record, :id, :clock_type, :time, :user_id, :created_at, :updated_at
json.url clock_record_url(clock_record, format: :json)

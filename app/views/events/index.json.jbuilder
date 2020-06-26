json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :start, :end, :user_id
  json.url event_url(event, format: :html) 
end
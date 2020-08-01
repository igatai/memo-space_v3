json.array!(@events) do |event|
  json.id event.id
  json.start event.start
  json.end event.end
  json.user_id event.user_id
  json.title event.title
  json.text event.text
  json.url event_url(event, format: :html) 
end
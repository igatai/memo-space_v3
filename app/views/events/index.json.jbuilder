json.array!(@events) do |event|
  # binding.pry
  # json.extract! event, :id, :start, :end, :user_id, :title, :content
  json.id event.id
  json.start event.start
  json.end event.end
  json.user_id event.user_id
  # json.title event.memo.title
  # json.text event.memo.text
  json.title event.title
  json.text event.text
  # json.extract! event, :id, :start, :end, :user_id
  # json.extract! memo, :title, :text, :image
  json.url event_url(event, format: :html) 
end
json.array!(@consumers) do |consumer|
  json.extract! consumer, :id
  json.url consumer_url(consumer, format: :json)
end

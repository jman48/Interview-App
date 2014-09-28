json.array!(@interviews) do |interview|
  json.extract! interview, :id, :company
  json.url interview_url(interview, format: :json)
end

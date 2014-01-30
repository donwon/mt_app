json.array!(@projects) do |project|
  json.extract! project, :id, :title, :client, :body, :status, :category, :hit_counter
  json.url project_url(project, format: :json)
end

json.array!(@projects) do |project|
  json.extract! project, :id, :organization_id, :name, :description, :input_folder, :output_folder, :run_frequency, :run_at
  json.url project_url(project, format: :json)
end

json.projects @projects do |project|
  json.id project.id
  json.name project.name
  json.created_at project.created_at
end
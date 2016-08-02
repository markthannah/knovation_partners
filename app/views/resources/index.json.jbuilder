json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :description, :url, :lrt, :subject, :keyword, :author/publisher, :grade, :role, :language, :standard
  json.url resource_url(resource, format: :json)
end

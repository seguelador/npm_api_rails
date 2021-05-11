json.extract! repository, :id, :name, :version, :description, :url, :publisher, :created_at, :updated_at
json.url repository_url(repository, format: :json)

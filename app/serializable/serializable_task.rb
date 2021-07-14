class SerializableTask < JSONAPI::Serializable::Resource
  type 'tasks'
  attribute :name
  attribute :subject
  attribute :done
  attribute :priority
  attribute :created_at
  attribute :updated_at
  has_one :project
end

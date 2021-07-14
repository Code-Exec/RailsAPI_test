class SerializableProject < JSONAPI::Serializable::Resource
  type 'projects'
  link :self do 
    "/projects/#{@object.id}"
  end
  attribute :name
  attribute :created_at
  attribute :updated_at
  has_many :tasks
end

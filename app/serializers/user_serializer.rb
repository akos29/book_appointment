class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name
end

# UserSerializer.new(#user).serializable_hash[:data][:attributes]

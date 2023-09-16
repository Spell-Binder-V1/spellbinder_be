class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :password_digest
end
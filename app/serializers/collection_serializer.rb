class CollectionSerializer
  include JSONAPI::Serializer
  attributes :code, :name, :type, :release_date, :block
end

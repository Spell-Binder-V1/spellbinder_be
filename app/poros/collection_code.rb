class CollectionCode
  attr_reader :code, :id

  def initialize(attributes, id)
    @id = id
    @code = attributes[:code]
  end
end
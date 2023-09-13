class Collection
  attr_reader :code, :name, :type, :release_date, :block, :id

  def initialize(attributes, id)
    @id = id
    @code = attributes[:code]
    @name = attributes[:name]
    @type = attributes[:type]
    @release_date = attributes[:releaseDate]
    @block = attributes[:block]
  end
end
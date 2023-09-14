class Error
  attr_reader :status, :error

  def initialize(attributes)
    @status = attributes[:status]
    @error = attributes[:error]
  end
end
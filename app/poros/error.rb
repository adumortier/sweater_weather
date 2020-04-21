class Error

  attr_reader :id, :message

  def initialize(message)
    @id = 'poro'
    @message = message 
  end

  def self.serialize(message)
    ErrorSerializer.new(Error.new(message))
  end
  
end
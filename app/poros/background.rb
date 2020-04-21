class Background

  attr_accessor :id, :url

  def initialize(url) 
    @id = 'poro'
    @url = url
  end 

  def self.get_image_url(location)
    url = UnsplashService.get_image_url(location)
    Background.new(url)
  end

  def serialize
    BackgroundSerializer.new(self)
  end
  
end
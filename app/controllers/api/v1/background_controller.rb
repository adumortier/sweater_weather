class Api::V1::BackgroundController < ApplicationController

  def index
    url = UnsplashService.get_image_url(params[:location])
    background = Background.new(url)
    render json: BackgroundSerializer.new(background)
  end

end
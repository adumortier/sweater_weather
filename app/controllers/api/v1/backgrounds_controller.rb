class Api::V1::BackgroundsController < ApplicationController

  def index
    background = Background.get_image_url(params[:location])
    render json: background.serialize, status: 200
  end

end
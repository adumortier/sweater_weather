class Api::V1::BackgroundsController < ApplicationController

  def index
    return render json: Error.serialize('You have missing query parameters'), status: 401 if missing_params?
    background = Background.get_image_url(params[:location])
    render json: background.serialize, status: 200
  end

  private

  def missing_params?
    background_params[:location].nil? || background_params[:location] == ''
  end

  def background_params
    params.permit(:location)
  end

end
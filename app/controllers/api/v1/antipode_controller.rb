class Api::V1::AntipodeController < ApplicationController

  def index
    antipode = Antipode.get_info(params[:location])
    render json: antipode.serialize, status: 200
  end

end
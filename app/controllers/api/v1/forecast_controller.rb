class Api::V1::ForecastController < ApplicationController

  def index
    forecast = WeatherInfo.get_forecast(params[:location])
    render json: forecast.serialize, status: 200
  end

end
class Api::V1::ForecastController < ApplicationController

  def index
    return render json: Error.serialize('You have missing query parameters'), status: 401 if missing_params?
    forecast = WeatherInfo.get_forecast(params[:location])
    render json: forecast.serialize, status: 200
  end

  private

  def missing_params?
    forecast_params[:location].nil? || forecast_params[:location] == ''
  end

  def forecast_params
    params.permit(:location)
  end

end
class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.where(api_key: params[:api_key]).first
    return render json: Error.serialize('Your API key is invalid'), status: 401 if user.nil?
    return render json: Error.serialize('You have missing query parameters'), status: 401 if missing_query_parameters?
    road_trip = RoadTrip.get_road_trip_info(params[:origin], params[:destination])
    render json: road_trip.serialize, status: 200
  end

  private 
  
  def missing_query_parameters?
    query_params[:origin].nil? || query_params[:destination].nil? || query_params[:destination] =='' || query_params[:origin] == ''
  end

  def query_params
    params.permit(:origin, :destination, :api_key)
  end

end

class Api::V1::RoadTripController < ApplicationController

  def create 
    user = User.where(api_key: params[:api_key]).first
    if user.nil?
      render json: Error.serialize('Your API key is invalid'), status: 401
    else
      road_trip = RoadTrip.get_road_trip_info(params[:origin], params[:destination])
      render json: road_trip.serialize, status: 200
    end
  end

end
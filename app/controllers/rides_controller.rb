class RidesController < ApplicationController

  # POST /rides - create_ride_path
  def create
    @ride = Ride.new(ride_params)
    take_ride_return = @ride.take_ride

    # take_ride returned an error message. Do not save and flash an error.
    if take_ride_return.is_a?(String)
      redirect_to user_path(current_user), flash: {error: take_ride_return}

    # Save the ride and thank the person for riding the attraction.
    else
      @ride.save
      redirect_to user_path(current_user), flash: {message: "Thanks for riding the #{@ride.attraction.name}!"}
    end
  end

private
  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
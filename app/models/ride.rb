class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  # Called when a rider wants to ride an attraction
  # Either updates the rider's tickets count and ratings or returns an error message.
  # If take_ride returns an error message, the ride will not be saved.
  def take_ride
    error_message = "Sorry."
    error_message += " You do not have enough tickets the #{attraction.name}." if attraction.tickets > user.tickets
    error_message += " You are not tall enough to ride the #{attraction.name}." if attraction.min_height > user.height

    # No errors were added
    if error_message == "Sorry."
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating

      user.save

    # Return an error message to show to rider
    else
      error_message
    end

  end
end

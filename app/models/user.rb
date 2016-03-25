class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    happiness >= nausea ? "happy" : "sad" if happiness && nausea
  end
end

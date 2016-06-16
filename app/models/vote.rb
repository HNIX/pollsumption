class Vote < ActiveRecord::Base
  geocoded_by :user_ip,
    latitude: :latitude, longitude: :longitude
  after_validation :geocode

  belongs_to :user
  belongs_to :vote_option
  counter_culture :vote_option

  
end

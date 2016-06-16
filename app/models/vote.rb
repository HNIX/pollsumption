class Vote < ActiveRecord::Base
  geocoded_by :user_ip,
    latitude: :latitude, longitude: :longitude
  reverse_geocoded_by :latitude, :longitude do |obj,results|
  	if geo = results.first
  		obj.state = geo.state
  	end
  end
  after_validation :geocode
  after_validation :reverse_geocode

  belongs_to :user
  belongs_to :vote_option
  counter_culture :vote_option

  
end

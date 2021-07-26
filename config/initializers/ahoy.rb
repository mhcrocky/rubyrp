class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = false


# set visit duration (default is 4 hours)
Ahoy.visit_duration = 3.hours

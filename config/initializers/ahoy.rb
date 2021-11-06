class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = true

# set visit duration (default is 4 hours)
Ahoy.visit_duration = 3.hours

# Ahoy.mask_ips = true
# Ahoy.cookies = false

# # track bots hitting production site
# Ahoy.track_bots = true

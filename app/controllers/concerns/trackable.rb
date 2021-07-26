# Handle Ahoy errors w/o affecting the UX
module Trackable
  extend ActiveSupport::Concern

  def track(name, properties = {})
    ahoy.track name, properties
  rescue StandardError => error
    # TODO: notify error tracker
  end

end

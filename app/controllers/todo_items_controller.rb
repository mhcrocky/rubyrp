class TodoItemsController < ApplicationController
  before_action :authenticate_user!
  include Trackable
  def index
    ahoy.track "Viewed ToDo List"
  end
end

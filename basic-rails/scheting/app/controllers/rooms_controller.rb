class RoomsController < ApplicationController
  authorize_resource

  def index
    @rooms = Room.all
  end
end

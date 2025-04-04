class ClassRoomsController < ApplicationController

  def index
    @class_rooms = ClassRoom.all
  end
end

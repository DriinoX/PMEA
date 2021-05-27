class RacesController < ApplicationController
  def create
    @race = Race.create(room: Room.find(params[:room_id]))
    redirect_to race_horses_path(@race)
  end

  def show
    @race = Race.find(params[:id])
    @users = @race.room.users
  end
end

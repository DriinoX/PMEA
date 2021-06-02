class RacesController < ApplicationController
  def create
    @race = Race.create(room: Room.find(params[:room_id]))
    @race.progress = "started"
    @race.save
    redirect_to race_horses_path(@race)
  end

  def show
    @race = Race.find(params[:id])
    @users = @race.room.users
    @runnings = @race.runnings
  end
end

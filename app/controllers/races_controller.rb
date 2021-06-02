class RacesController < ApplicationController
  def create
    @race = Race.create(room: Room.find(params[:room_id]))
    @race.progress = "started"
    @race.save
    redirect_to race_horses_path(@race)
  end

  def show
    @race = Race.find(params[:id])
    @room = @race.room
    @runnings = @race.runnings
    @users = @race.room.users.select { |user| user.bet_for(@race).present? }
  end
end

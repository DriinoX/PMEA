class RacesController < ApplicationController
  def create

  end
  def show
    @race = Race.find(params[:id])
    @users = @race.room.users
  end
end

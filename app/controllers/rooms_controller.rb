class RoomsController < ApplicationController
    before_action :authenticate_user!

  def show
    @room = Room.find(params[:id])
    @participations = Participation.where(room: @room)
    @race = @room.races.last
    if @race&.pending?
      redirect_to race_horses_path(@race)
    end
  end

  def create
    @room = Room.new(user: current_user)
    code = rand(1..9999)
    @room.code = code
    @room.save
    Participation.create(room: @room, user: current_user)
    redirect_to room_path(@room)
  end

  def destroy
    # @user = user.find(params[:id])
    # @user.destroy
      # si le current user le veux il peut se supprimer de la partie, sinon, même s'il quitte la page
      # la partie continue avec lui.
  end
end

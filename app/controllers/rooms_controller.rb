class RoomsController < ApplicationController
    before_action :authenticate_user!

  def show
    @room = Room.find(params[:id])
    @participations = Participation.where(room: @room)
    @users = []
    @participations.each do |participation|
      @users << participation.user
    end
  end

  def create
    @room = Room.new(user: current_user)
    code = rand(1..9999)
    @room.code = code
    @room.save
    redirect_to room_path(@room)
  end
end

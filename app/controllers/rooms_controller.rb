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
    if params[:code]
      @room = Room.where(code: params[:code])
      redirect_to room_path(@room.first.id)
    else
      @room = Room.new(user: current_user)
      @room.save
      redirect_to room_path(@room)
    end
  end
end

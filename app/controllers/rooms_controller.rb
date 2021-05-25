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
    @room = Room.new(room_params)
  end
end

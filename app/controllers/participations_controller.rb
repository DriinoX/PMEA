class ParticipationsController < ApplicationController
  def create
    if params[:code].present?
      @room = Room.find_by(code: params[:code])
      if Participation.find_by(user: current_user, room: @room)
        redirect_to room_path(@room) and return
      end
      @participation = Participation.new(user: current_user, room: @room)
      if @participation.save
              RoomChannel.broadcast_to(
        @room,
        render(partial: "participation", locals: { participation: @participation })
      )
        redirect_to room_path(@room)
      else
        flash[:notice] = "Le code entré n'est pas valide"
        render 'pages/home'
      end
    else
      flash[:notice] = "rentre un code, idiot"
      render 'pages/home'
    end
  end
end

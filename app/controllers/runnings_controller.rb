class RunningsController < ApplicationController
  def create
  end

  # /races/:race_id/runnings
  def index
    @race = Race.find(params[:race_id])
    @users = @race.room.users
    room_id = @race.room_id
    @room = Room.find(room_id)
    @results = []

    @users.each do |user|
      bet = user.bets.find_by(race: @race)
      position = bet.horse.runnings.find_by(race: @race).position
      if position == 1
        sip = bet.sip * 2
        x = "distribue"
      elsif position == 2
        sip = bet.sip
        x = "distribue"
      elsif position == 3
        sip = bet.sip
        x = "boit ET distribue"
      elsif position == 4
        sip = bet.sip
        x = "boit"
      else
        sip = bet.sip * 2
        x = "boit"

      end

      @results << {
        username: user.username,
        sip: sip,
        position: position,
        x: x
      }
    end
    @results.sort_by! { |result| result[:position] }
  end
end

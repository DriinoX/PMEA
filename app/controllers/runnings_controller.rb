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
    @classement = [1, 2, 3, 4, 5]
    @p1 = 1
    @p2 = 2
    @p3 = 3
    @p4 = 4
    @p5 = 5
    @zouho1 = []
    @zouho2 = []
    @zouho3 = []
    @zouho4 = []
    @zouho5 = []
    @cheval = ""


    @users.each do |user|
      bet = user.bets.find_by(race: @race)
      position = bet.horse.runnings.find_by(race: @race).position
      if position == 1
        sip = bet.sip * bet.horse.runnings.find_by(race: @race).rating
      elsif position == 2
        sip = (bet.sip * bet.horse.runnings.find_by(race: @race).rating) / 2
      elsif position == 3
        sip = bet.sip
      elsif position == 4
        sip = (bet.sip / 2)
      else
        sip = bet.sip

      end

      @results << {
        username: user.username,
        sip: sip,
        position: position,
      }
    end
    @results.sort_by! { |result| result[:position] }
    @race.progress = "closed"
    @race.save

  end
end

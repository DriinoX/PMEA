class HorsesController < ApplicationController
  def index
    @race = Race.find(params[:race_id])
    @horses = Horse.all
    @bet = Bet.new
  end
end

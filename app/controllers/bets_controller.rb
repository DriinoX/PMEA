class BetsController < ApplicationController
  def new

  end

  def create
    @race = Race.find(params[:race_id])
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.race = @race
    @bet.horse = Horse.find(params[:bet][:horse_id])
    if @bet.save
      redirect_to race_path(@race)
    else
      flash[:alert] = @bet.errors.full_messages
      redirect_to race_horses_path(@race)
    end
  end

  def edit

  end

  def update

  end

  private

  def bet_params
    params.require(:bet).permit(:sip)
  end
end

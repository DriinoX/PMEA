class HorsesController < ApplicationController
  def index
   @horses = Horse.all
  end
end

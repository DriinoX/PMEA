class BetsController < ApplicationController
  def new

  end

  def create
   if bet_find()
    update
   else
    create
   end
  end

  def edit

  end

  def update

  end
end

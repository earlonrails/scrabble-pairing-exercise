class PlaysController < ApplicationController
  def index
    @play = Play.new

    @plays = Play.all
  end

  def new
  end

  def create
    @play = Play.create(play_params)

    redirect_to '/plays'
  end

  def play_params
    params.require(:play).permit(:word)
  end
end

class PlaysController < ApplicationController
  def index
  	@plays = Play.recent
  end

  def new
  	@play = Play.new
  end

  def create
  	@play = Play.new(play_params)

  	if @play.save
  		redirect_to plays_path
  	else
  		render :new
  	end
  end

  def destroy
  	Play.find(params[:id]).destroy!
  	redirect_to plays_path
  end

  private

  def play_params
  	params.require(:play).permit(:word)
  end
end

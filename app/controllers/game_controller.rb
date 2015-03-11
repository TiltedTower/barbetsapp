class GameController < ApplicationController

  def index
    @conn = OddsFeed.new
    @sorted_games = @conn.games(params[:sport])
  end

end

class TeamController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by_original_id(params[:id])
    @players = @team.players
  end

  private

  def team_params
    params.require(:team).permit(:id)
  end
end

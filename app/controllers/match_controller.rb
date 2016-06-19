class MatchController < ApplicationController
  def show
    @events = Match.find_by_original_id(params[:id]).events.order(minute: :ASC)
  end

  private

  def team_params
    params.require(:match).permit(:id)
  end
end

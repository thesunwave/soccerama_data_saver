class CompetitionController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @seasons = Competition.find_by_original_competition_id(params[:id]).seasons
  end

  private

  def competition_params
    params.require(:competition).permit(:id)
  end
end

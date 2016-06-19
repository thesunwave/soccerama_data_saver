class SeasonController < ApplicationController

  def show
    @matches = Season.find_by_original_id(params[:id]).matches
  end

  private

  def season_params
    params.require(:season).permit(:id)
  end
end

class PlayerController < ApplicationController
  def show
    @player = Player.includes(:events).find_by_original_id(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:id)
  end
end

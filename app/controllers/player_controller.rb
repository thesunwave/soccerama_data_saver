class PlayerController < ApplicationController
  def show
    @player = Player.includes(:events).find_by_original_id(params[:id])
  end

  def download
    @player = Player.includes(:events).find_by_original_id(params[:player_id])
    send_csv(@player)
  end

  private

  def player_params
    params.require(:player).permit(:id)
  end
end

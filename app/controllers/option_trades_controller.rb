class OptionTradesController < ApplicationController
  def create
    option_trade = OptionTrade.create(option_trade_params)
    render json: option_trade.present
  end

  def index
    render json: OptionTrade.all.map(&:present)
  end

  private

  def option_trade_params
    params.require(:option_trade).permit(:action, :strike, :premium)
  end
end

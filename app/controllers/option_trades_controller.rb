class OptionTradesController < ApplicationController
  def create
    option_trade = OptionTrade.create(action: 'call', strike: 10.0, premium: 1.0)
    render json: option_trade.present
  end

  def index
    render json: OptionTrade.all.map(&:present)
  end

  private
end

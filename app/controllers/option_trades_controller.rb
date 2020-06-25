class OptionTradesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    option_trade = OptionTrade.create(option_trade_params)
    render json: option_trade.present
  end

  def index
    render json: OptionTrade.all.map(&:present)
  end

  private

  def option_trade_params
    trade_params = {}
    trade_params[:type] = params.fetch(:type)
    trade_params[:strike] = params.fetch(:strike)
    trade_params[:premium] = params.fetch(:premium)
    trade_params
  end
end

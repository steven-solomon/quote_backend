class HistoryController < ApplicationController
  include TradierRequest

  def get
    render json: historical_data
  end

  def historical_data
    endpoint = endpoint_for_symbol(params['symbol'])
    response = raw_response(endpoint)
    parse_history(response)
  end

  private

  def endpoint_for_symbol(symbol)
    start_date = '2019-05-04'
    end_date = '2020-05-04'
    "#{base_url}/v1/markets/history?symbol=#{symbol}&start=#{start_date}&end=#{end_date}"
  end

  def parse_history(body)
    day_data = JSON.parse(body).fetch('history').fetch('day')
    day_data.map { |day| day.fetch("close") }
  end
end
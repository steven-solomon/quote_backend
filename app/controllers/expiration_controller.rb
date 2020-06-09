class ExpirationController < ApplicationController
  include TradierRequest

  def get
    render json: expirations
  end

  def expirations
    endpoint = endpoint_for_symbol(params['symbol'])
    response = raw_response(endpoint)
    parse_expirations(response)
  end

  def parse_expirations(body)
    JSON.parse(body).fetch('expirations').fetch('date')
  end

  def endpoint_for_symbol(symbol)
    "#{base_url}/v1/markets/options/expirations?symbol=#{symbol}"
  end
end
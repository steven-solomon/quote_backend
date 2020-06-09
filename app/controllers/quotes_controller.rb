class QuotesController < ApplicationController
  include TradierRequest

  def get
    render json: quote
  end

  def quote
    endpoint = endpoint_for_symbol(params['symbol'])
    response = raw_response(endpoint)
    parse_quote(response)
  end

  def parse_quote(body)
    securities = JSON.parse(body).fetch('securities').fetch('security')
    if securities.kind_of?(Array)
      securities
    else
      [securities]
    end
  end

  def endpoint_for_symbol(symbol)
    "#{base_url}/v1/markets/lookup?q=#{symbol}&types=stock"
  end
end
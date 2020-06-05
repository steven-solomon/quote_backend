class QuotesController < ApplicationController
  def get
    render json: quote_data
  end

  def quote_data
    endpoint = endpoint_for_symbol(params['symbol'])
    response = raw_response(endpoint)
    parse_quote(response)
  end

  def parse_quote(body)
    JSON.parse(body).fetch('quotes').fetch('quote')
  end

  def raw_response(endpoint)
    response = HTTParty.get(endpoint, headers: {
        'Authorization' => "Bearer #{client_id}",
        'Accept' => 'application/json'
      })

    response.body
  end

  def endpoint_for_symbol(symbol)
    "https://sandbox.tradier.com/v1/markets/quotes?symbols=#{symbol}&greeks=false"
  end

  def client_id
    ENV.fetch('CLIENT_ID')
  end
end
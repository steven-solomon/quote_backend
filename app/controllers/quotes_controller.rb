class QuotesController < ApplicationController
  def get
    render json: quote_data
  end

  def quote_data
    parse_quote(raw_response)
  end

  def parse_quote(body)
    JSON.parse(body).fetch('quotes').fetch('quote')
  end

  def raw_response
    response = HTTParty.get(endpoint, headers: {
        'Authorization' => "Bearer #{client_id}",
        'Accept' => 'application/json'
      })

    response.body
  end

  def endpoint
    'https://sandbox.tradier.com/v1/markets/quotes?symbols=AAPL&greeks=false'
  end

  def client_id
    ENV.fetch('CLIENT_ID')
  end
end
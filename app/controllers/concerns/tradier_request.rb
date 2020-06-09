module TradierRequest
  def raw_response(endpoint)
    response = HTTParty.get(endpoint, headers: {
        'Authorization' => "Bearer #{client_id}",
        'Accept' => 'application/json'
    })

    response.body
  end

  def client_id
    ENV.fetch('CLIENT_ID')
  end

  def base_url
    "https://sandbox.tradier.com"
  end
end
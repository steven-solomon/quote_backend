require 'rails_helper'

describe 'OptionTrades', type: :request do
  let (:params) do
    {type: type, strike: 10.0, premium: 1.0}
  end
  describe 'when calling' do
    let(:type) { 'call' }
    it 'creates a call option trade' do
      post '/option_trades', headers: {'ACCEPT' => 'application/json'}, params: params

      expect(JSON.parse(response.body)).to eq({"type" => 'call', "strike" => 10.0, "premium" => 1.0})

      get '/option_trades', headers: {'Content-Type' => 'application/json'}

      expect(JSON.parse(response.body)).to eq([{"type" => 'call', "strike" => 10.0, "premium" => 1.0}])
    end
  end

  describe 'when putting' do
    let(:type) { 'put' }
    it 'creates a put option trade' do
      post '/option_trades', headers: {'ACCEPT' => 'application/json'}, params: params

      expect(JSON.parse(response.body)).to eq({"type" => 'put', "strike" => 10.0, "premium" => 1.0})

      get '/option_trades', headers: {'Content-Type' => 'application/json'}

      expect(JSON.parse(response.body)).to eq([{"type" => 'put', "strike" => 10.0, "premium" => 1.0}])
    end
  end
end

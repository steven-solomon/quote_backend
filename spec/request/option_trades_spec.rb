require 'rails_helper'

describe 'OptionTrades', type: :request do
  it 'creates a trade' do
    post '/option_trades', headers: {'ACCEPT' => 'application/json'}, params: { 'action' => 'call' }

    expect(JSON.parse(response.body)).to eq({})

    get '/option_trades', headers: {'Content-Type' => 'application/json'}

    expect(JSON.parse(response.body)).to eq([{'action' => 'call'}])
  end
end

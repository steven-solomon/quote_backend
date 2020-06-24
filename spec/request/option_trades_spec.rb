require 'rails_helper'

describe 'OptionTrades', type: :request do
  it 'creates a trade' do
    post '/option_trades', headers: {'ACCEPT' => 'application/json'}, params: {action: 'call', strike: 10.0, premium: 1.0}

    expect(JSON.parse(response.body)).to eq({action: 'call', strike: 10.0, premium: 1.0})

    get '/option_trades', headers: {'Content-Type' => 'application/json'}

    expect(JSON.parse(response.body)).to eq([{'action' => 'call'}])
  end
end

class OptionChainsController < ApplicationController
  include TradierRequest

  def get
    render json: option_chains
  end

  def option_chains
    endpoint = endpoint_for_symbol(params['symbol'], params['expiration'])
    response = raw_response(endpoint)
    parse_option_chains(response)
  end

  def parse_option_chains(body)
    options = JSON.parse(body).fetch("options").fetch("option")
    options.group_by { |option| option.fetch("strike") }.map do |strike, options|
      put_option = options.find {|o| o.fetch('option_type') == 'put'}
      call_option = options.find {|o| o.fetch('option_type') == 'call'}
      {strike: strike, put: put_option, call: call_option}
    end

    # puts foo
    #
    # puts = options.select { |option| option.fetch('option_type') == "put" }
    # calls = options.select { |option| option.fetch('option_type') == "call" }
    # {puts: puts, calls: calls}
  end

  def endpoint_for_symbol(symbol, expiration)
    "#{base_url}/v1/markets/options/chains?symbol=#{symbol}&expiration=#{expiration}"
  end
end
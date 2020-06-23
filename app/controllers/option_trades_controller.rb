class OptionTradesController < ApplicationController
  def create
    render json: {}
  end

  def index
    render json: [{action: 'call'}]
  end

  private
end

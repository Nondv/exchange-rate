class ExchangeRatesController < ApplicationController
  def index
    @rate = ExchangeRate.find_by(from: :dollar, to: :ruble)
    raise('Use seeds!') unless @rate
  end
end

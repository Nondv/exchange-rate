require 'rails_helper'

RSpec.describe ExchangeRatesController, :type => :controller do
  before :each do
    @dollar_to_ruble = ExchangeRate.create!(from: :dollar, to: :ruble, value: 100)
  end

  describe 'index' do
    it 'assigns @exchange_rate' do
      get :index
      expect(assigns(:rate)).to eq @dollar_to_ruble
    end
  end
end

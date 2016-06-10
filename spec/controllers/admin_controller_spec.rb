require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  before :each do
    @dollar_to_ruble = ExchangeRate.create!(from: :dollar, to: :ruble, value: 100)
  end

  describe 'index' do
    it 'assigns @rate' do
      get :index
      expect(assigns(:rate)).to eq @dollar_to_ruble
    end
  end

  describe 'force' do
    it 'updates dollar to ruble rate' do
      value = 2 * @dollar_to_ruble.value
      forced_to = Time.now

      post :force, params: { value: value, time: forced_to }
      @dollar_to_ruble.reload
      expect(@dollar_to_ruble.forced_value).to eq(value)
      expect(@dollar_to_ruble.forced_to).to be_present # TODO: check equality
    end
  end
end

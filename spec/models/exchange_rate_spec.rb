require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  context 'from scratch + validate' do
    before(:each) do
      @rate = ExchangeRate.new
      @rate.validate
    end

    it('is not valid') { expect(@rate).not_to be_valid }
    it('has error on :from') { expect(@rate.errors.keys).to include(:from) }
    it('has error on :to') { expect(@rate.errors.keys).to include(:to) }
    it('has error on :value') { expect(@rate.errors.keys).to include(:value) }
  end

  it 'validates if :value > 0' do
    rate = ExchangeRate.new from: :dollar,
                            to: :ruble,
                            value: 1

    expect(rate).to be_valid
    rate.value = -1
    expect(rate).not_to be_valid
  end
end

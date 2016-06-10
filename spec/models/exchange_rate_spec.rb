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

  let(:valid_attributes) do
    { from: :dollar,
      to: :ruble,
      value: 10,
      forced_value: 1,
      forced_to: Time.now }
  end

  it 'validates if :value > 0' do
    rate = ExchangeRate.new(valid_attributes)

    expect(rate).to be_valid
    rate.value = -1
    expect(rate).not_to be_valid
  end

  it 'validates if :forced_value > 0' do
    rate = ExchangeRate.new(valid_attributes)

    expect(rate).to be_valid
    rate.forced_value = -1
    expect(rate).not_to be_valid
  end

  describe '#current_value method' do
    context 'when forced_to in the future' do
      before(:each) do
        @rate = ExchangeRate.create!(valid_attributes)
        @rate.update_attributes!(forced_to: Date.today + 1)
      end

      it 'returns forced value' do
        expect(@rate.current_value).to eq(@rate.forced_value)
      end
    end

    context 'when forced_to in the past' do
      before(:each) do
        @rate = ExchangeRate.create!(valid_attributes)
        @rate.update_attributes!(forced_to: Date.today - 1)
      end

      it 'returns .value' do
        expect(@rate.current_value).to eq(@rate.value)
      end
    end
  end
end

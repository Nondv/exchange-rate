class ExchangeRate < ApplicationRecord
  # WARNING: add new currencies ONLY to END of list (it is used in enum)
  #          and NEVER change order of symbols!
  CURRENCIES = %i(dollar ruble).freeze
  enum from: CURRENCIES, _prefix: true
  enum to: CURRENCIES, _prefix: true

  validates :from, :to, :value, presence: true
  validate :value_should_be_positive, if: -> { value.present? }

  private

  def value_should_be_positive
    errors.add(:value, :should_be_positive) unless value > 0
  end
end

class ExchangeRate < ApplicationRecord
  # WARNING: add new currencies ONLY to END of list (it is used in enum)
  #          and NEVER change order of symbols!
  CURRENCIES = %i(dollar ruble).freeze
  enum from: CURRENCIES, _prefix: true
  enum to: CURRENCIES, _prefix: true

  validates :from, :to, :value, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :forced_value,
            numericality: { greater_than: 0 },
            if: -> { forced_value.present? }

  after_save :broadcast_current_value

  def current_value
    return value unless forced_value
    forced_to > Time.now ? forced_value : value
  end

  private

  def broadcast_current_value
    stream = "#{from}_to_#{to}".to_sym
    ActionCable.server.broadcast(stream, current_value: current_value)
  end
end

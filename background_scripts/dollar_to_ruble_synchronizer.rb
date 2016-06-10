SLEEP_TIME = 5
@rate = ExchangeRate.find_by(from: :dollar, to: :ruble)
raise('run seeds first!') unless @rate

def update_currency
  # TODO
  @rate.update_attributes(value: rand(200))
end

loop do
  update_currency
  sleep(SLEEP_TIME)
end

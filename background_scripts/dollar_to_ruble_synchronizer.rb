require 'open-uri'

SLEEP_TIME = 5

@rate = ExchangeRate.find_by(from: :dollar, to: :ruble)
raise('run seeds first!') unless @rate


def update_currency
  new_value = usd_rate_from_cbr
  return unless new_value

  @rate.reload
  @rate.update_attributes(value: new_value)
end

def usd_rate_from_cbr
  # XML with many currencies
  uri = URI.parse('http://www.cbr.ru/scripts/XML_daily.asp')
  rate_list = Hash.from_xml(uri.read)

  usd = rate_list['ValCurs']['Valute'].find { |e| e['CharCode'] == 'USD' }
  usd && usd['Value'].sub(',', '.').to_f
rescue # just to KISS
  Rails.logger.error "Can't get USD rate from CBR"
  nil
end

loop do
  update_currency
  sleep(SLEEP_TIME)
end

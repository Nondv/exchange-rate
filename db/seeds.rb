rates = [{ from: :dollar, to: :ruble, value: 60 }]
rates.each do |params|
  next if ExchangeRate.find_by(params.except(:value))
  ExchangeRate.create!(params)
  puts "Create exchange rate #{params[:from]} -> #{params[:to]}"
end

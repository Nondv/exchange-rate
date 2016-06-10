class AddForcedToToExchangeRates < ActiveRecord::Migration[5.0]
  def change
    add_column :exchange_rates, :forced_to, :datetime
  end
end

class CreateExchangeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rates do |t|
      # it will be enums in model
      t.integer :from, null: false
      t.integer :to, null: false

      t.float :value, null: false
      t.datetime :frozen_to

      t.timestamps
    end

    add_index :exchange_rates, :from
    add_index :exchange_rates, :to
    add_index :exchange_rates, :frozen_to
  end
end

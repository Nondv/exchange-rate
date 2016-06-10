# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CurrencyChannel < ApplicationCable::Channel
  def subscribed
    stream_from :dollar_to_ruble
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
  end
end

class AdminController < ApplicationController
  before_filter :set_rate, only: [:index, :force]

  def index
  end

  def force
    if @rate.update_attributes(forced_params)
      redirect_to admin_path
    else
      render :index
    end
  end

  private

  def set_rate
    @rate = ExchangeRate.find_by(from: :dollar, to: :ruble)
  end

  def forced_params
    { forced_value: params[:value],
      forced_to: params[:time] }
  end
end

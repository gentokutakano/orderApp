class SoukoZaikosController < ApplicationController
  def index
    @zaikos = SoukoZaiko.where(stock_type: "01")
  end

  def new

  end

  def create

  end
end

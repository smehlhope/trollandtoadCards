require 'csv'

class CardsController < ApplicationController

	def index
    if params[:search]
      @cards = Card.search(params[:search]).order("product_id DESC")
    else
      @cards = Card.paginate(:per_page => 100, :page => params[:page]).order("buy_price DESC")
    end
  end

  def import
    file = params[:file]
		Card.import(file)
    redirect_to root_url, notice: "Cards imported."
  end

end

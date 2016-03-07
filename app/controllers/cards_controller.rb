require 'csv'
require 'will_paginate/array' 

class CardsController < ApplicationController

	def index
    if params[:search]
      @cards = Card.search(params[:search]).paginate(:per_page => 250, :page => params[:page]).order("buy_price DESC")
    else
      @cards = Card.paginate(:per_page => 250, :page => params[:page]).order("buy_price DESC")
    end
  end

  def import
    file = params[:file]
		Card.import(file)
    redirect_to root_url, notice: "Cards imported."
  end

end

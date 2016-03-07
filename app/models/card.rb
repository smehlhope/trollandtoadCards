class Card < ActiveRecord::Base
	require 'csv'

  def self.import(file)
		CSV.foreach(file.path, :headers => true, :col_sep => ',') do |row|
	  	card_data = { :product_id => row['Product Id'], 
										:set => row['Set'], 
										:edition => row['Edition'], 
										:condition => row['Condition'], 
										:buy_price => row['Buy Price'], 
										:buy_quantity => row['Buy Qty'], 
										:sell_quantity => row['Sell Qty']
									}
			card = Card.find_by_product_id(card_data['prodcut_id'])
  		if card
  			card.update_attributes(card_data)
  		else
  			Card.create(card_data)
  		end
  	end # end CSV.foreach
   end # end self.import(file)


  def self.search(search)
	  where('edition ILIKE ?', "%#{search}%")
	  where('set ILIKE ?', "%#{search}%")
	end

	WillPaginate.per_page = 100

end

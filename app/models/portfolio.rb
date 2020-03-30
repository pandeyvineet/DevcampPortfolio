class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	# custome scopes creation-method 1
	# self is a class method and here it means we are referencing currecnt version of portfolio means we are looking for a particular portfolio item when its called
	def self.angular
		where(subtitle: 'Angular')
		
	end

# custome scopes creation-method 2
#scope is a method inside models file for the portfolio
# -> ,this symbol is called lambda
scope :ruby_on_rails_portfolio_items,-> {where(subtitle: 'Ruby on Rails')}

end

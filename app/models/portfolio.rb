class Portfolio < ApplicationRecord
	has_many :technologies
	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	# "custome scopes" creation-method 1,this is the best way to write custom scopes as told by instructor
	# self is a class method and here it means we are referencing currecnt version of portfolio means we are looking for a particular portfolio item when its called
	def self.angular
		where(subtitle: 'Angular')
		
	end

# "custome scopes" creation-method 2
#scope is a method inside models file for the portfolio
# -> ,this symbol is called lambda
scope :ruby_on_rails_portfolio_items,-> {where(subtitle: 'Ruby on Rails')}


# setting defaults:it(after_initialize) means after an portfolio item has been initialized and portfolio item will initialize when a new item is called like "def new" in "portfolio_controoler.rb"
# set_defaults is the method we want to create
# after_initialize occurs when "def new" in "portfolio_controller.rb" runs means when form is generated
# after_create occurs when "def create" in "portfolio_controller.rb" runs
after_initialize :set_defaults

def set_defaults
	self.main_image ||= Placeholder.image_generator(height: '600',width: '400')
	self.thumb_image ||= Placeholder.image_generator(height: '350',width: '200')
end
end

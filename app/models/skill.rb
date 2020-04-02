class Skill < ApplicationRecord
	#include_Placeholder
	# "include placeholder reference is not working so I had to use
	Skill.connection
	validates_presence_of :title, :percent_utilized

	after_initialize :set_defaults

def set_defaults
	self.badge ||= Placeholder.image_generator(height: '250',width: '250')
end
end



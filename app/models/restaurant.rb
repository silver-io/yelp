class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3, message: ": this name is too short, choose another one"}, uniqueness: true

	def average_rating
		"N/A"
	end

end

class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	validates :name, length: {minimum: 3, message: ": this name is too short, choose another one"}, uniqueness: true

	def average_rating
		return "N/A" if reviews.none?
		# reviews.inject(0) {|memo, review| memo + review.rating} / reviews.count
		reviews.average(:rating)
	end


end

require 'rails_helper'

RSpec.describe Review, :type => :model do
	it 'is not valid with a rating less than one' do
		review = Review.new(rating: -1)
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

	it 'is not valid with a rating of more than five' do
		review = Review.new(rating: 6)
		expect(review).to have(1).error_on(:rating)
		expect(review).not_to be_valid
	end

	it 'it is valid with a rating between one and five' do
		review = Review.new(rating: 4)
		expect(review).to be_valid
	end



end

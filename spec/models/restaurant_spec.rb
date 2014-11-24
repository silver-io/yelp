require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
    it 'is not valid with a name of less than three characters' do
    	  restaurant = Restaurant.new(name: "Ta")
    	  expect(restaurant).to have(1).error_on(:name)
    	  expect(restaurant).not_to be_valid
    end

    it 'is not valid unless it has a unique name' do
    	  Restaurant.create(name: "Red Pizza")
    	  restaurant = Restaurant.new(name: "Red Pizza")
    	  expect(restaurant).to have(1).error_on(:name)
    end

    describe '#average_rating' do
        context 'no reviews' do
            it 'returns "N/A" when there are no reviews' do
              restaurant = Restaurant.create(name: "Red Pizza")
              expect(restaurant.average_rating).to eq 'N/A'
            end
        end

        context 'one review' do
            it 'returns that rating' do
              restaurant = Restaurant.create(name: "Red Pizza")
              restaurant.reviews.create(rating: 4)
              expect(restaurant.average_rating).to eq 4
            end

        end

        context 'multiple reviews' do
          it 'returns the average' do
             restaurant = Restaurant.create(name: "Red Pizza")
             restaurant.reviews.create(rating: 3)
             restaurant.reviews.create(rating: 5)
             expect(restaurant.average_rating).to eq 4
          end
        end
    end
end
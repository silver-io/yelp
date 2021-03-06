 require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name: 'The Mill')
	end

	def leave_review(thoughts, rating)
		visit '/restaurants'
		click_link 'Review The Mill'
		fill_in "Thoughts", with: thoughts
		select rating, from: 'Rating'
		click_button 'Leave review'
	end


	it "allows users to leave reviews using the form that appears alongside restaurants" do
		leave_review("so so ", "3")
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so so'
	end

	it "displays an average rating for all reviews" do
		leave_review('So so', "3")
        leave_review('Great', "5")
        expect(page).to have_content("Average rating: ★★★★☆")
	end
end

require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name: 'The Mill')
	end

	it "allows users to leave reviews using the form that appears alongside restaurants" do
		visit '/restaurants'
		click_link 'Review The Mill'
		fill_in "Thoughts", with: "so so"
		select '3', from: 'Rating'
		click_button 'Leave review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'so so'
	end
end

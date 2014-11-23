require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants have been added' do
      it 'should display a prompt to add a restaurant' do
	      visit '/restaurants'
	      expect(page).to have_content 'No restaurants'
	      expect(page).to have_link 'Add a restaurant'
      end
    end

    context 'restaurants have been added' do
    	before do
    		Restaurant.create(name: 'Casa Pepe')
    	end
    	it 'should display restaurants' do
    		visit '/restaurants'
    		expect(page).to have_content('Casa Pepe')
    		expect(page).not_to have_content('No restaurants')
    	end
    end
end

describe 'creating restaurants' do
		 it 'prompts user to fill out a form, then displays the new restaurant' do
		   visit '/restaurants'
		   click_link 'Add a restaurant'
		   fill_in 'Name', with: 'Casa Pepe'
		   click_button 'Create Restaurant'
		   expect(page).to have_content 'Casa Pepe'
		   expect(current_path).to eq '/restaurants'
        end
end
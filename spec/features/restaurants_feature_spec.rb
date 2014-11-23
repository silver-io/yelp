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
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
	context 'a valid restaurant' do
			 it 'prompts user to fill out a form, then displays the new restaurant' do
			   visit '/restaurants'
			   click_link 'Add a restaurant'
			   fill_in 'Name', with: 'Casa Pepe'
			   click_button 'Create Restaurant'
			   expect(page).to have_content 'Casa Pepe'
			   expect(current_path).to eq '/restaurants'
	        end
	end
	
	context 'an invalid restaurant' do
		     it 'does not let you submit a restaurant with a very short name' do
		     	visit '/restaurants'
		     	click_link 'Add a restaurant'
		        fill_in 'Name', with: 'Ta'
		        click_button 'Create Restaurant'
		        expect(page).not_to have_css 'h2', text: 'Ta'
		        expect(page).to have_content 'errors'

		     end

	end


end

describe 'editing restaurants' do
		 before do
		 	Restaurant.create(name: 'Casa Pepe')
		 end
	     it 'allows a user to edit a restaurant' do
	     	visit '/restaurants'
	     	click_link 'Edit Casa Pepe'
	     	fill_in 'Name', with: 'La Casa de Pepe'
	     	click_button 'Update Restaurant'
	     	expect(page).to have_content 'La Casa de Pepe'
	     	expect(current_path).to eq '/restaurants'
	     end
end

describe 'deleting restaurants' do
	     before do
	     	Restaurant.create(name: 'Casa Pepe')
	     end
	     it 'removes a restaurant when a user clicks a delete link' do
	     	visit '/restaurants'
	     	click_link 'Delete'
	     	expect(page).not_to have_content 'Casa Pepe'
	     	expect(page).to have_content 'Restaurant deleted successfully'
	     end
end

describe 'showing a restaurant' do
		context 'viewing restaurants' do

		  before do
		    Restaurant.create(name: "El Provocon", description: "Best ever")
		  end

		  it "has a restaurant and it\'s description' restaurant" do
		   visit '/restaurants'
		   click_link 'Show El Provocon'
		   expect(page).to have_content 'Best ever'
		   expect(current_path).to match(/restaurants\/\d/)
		  end
		end
end




























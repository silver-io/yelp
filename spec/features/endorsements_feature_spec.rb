require 'rails_helper'

describe 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 1, thoughts: "pretty bad")
  end

  it 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'Endorse review'
    expect(page).to have_content('1 endorsement')
  end

end
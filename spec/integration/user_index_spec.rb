require 'rails_helper'

RSpec.describe 'Test Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'ali', photo: 'ali.png', bio: 'bio1', posts_counter: 4)
      @first_user.save!
    end

    it 'shows the users username' do
      visit root_path
      expect(page).to have_content('ali')
    end

    it 'shows the users profile picture' do
      visit root_path
      expect(page).to have_css('img[src*="ali.png"]')
    end

    it 'shows the number of posts of each user' do
      visit root_path
      expect(page).to have_content('Total Posts: (4)')
    end
  end
end

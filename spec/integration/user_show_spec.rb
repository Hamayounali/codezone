require 'rails_helper'

RSpec.describe 'Test Show user Page', type: :feature do
  describe 'GET Show' do
    before(:each) do
      @user = User.create(name: 'Ranj', photo: 'image1.png', bio: 'bio1', posts_counter: 0)
      @user.save!
     
      @post = Post.create(
        title: 'first post', text: 'Some testing text', comments_counter: 0,
        likes_counter: 3, author_id: @user.id
      )

      visit("/users/#{@user.id}")
    end

    it 'shows the user username' do
      expect(page).to have_content('Ranj')
    end

    it 'shows the user profile picture' do
      expect(page).to have_css('img[src*="image1.png"]')
    end

    it 'shows the user bio' do
      expect(page).to have_content('bio1')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('(1)')
    end

    it 'shows all the posts the user has written' do
      expect(page).to have_content('first post')
    end

    it 'should have button to show all posts' do
      expect(page).to have_link('See All Posts')
    end
  end
end

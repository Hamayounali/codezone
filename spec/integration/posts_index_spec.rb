require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
  
    before(:each) do
      @user = User.create(
        name: 'aaaa', photo: 'https://test.com/test.png',
        bio: 'This is some test bio data', posts_counter: 0
      )
    
      @post = Post.create(
        title: 'testing', text: 'Some testing text', comments_counter: 0,
        likes_counter: 3, author_id: @user.id
      )

      @post = Post.create(
        title: 'testing', text: 'Some testing text', comments_counter: 0,
        likes_counter: 0, author_id: @user.id
      )

      @post = Post.create(
        title: 'testing', text: 'Some testing text', comments_counter: 0,
        likes_counter: 0, author_id: @user.id
      )
    
      @comment = Comment.create(text: 'this is my first commnet', post:@post, author: @user)
    
    end

    it "shows user's profile picture" do
      visit("/users/#{@user.id}")
      expect(page).to have_css('img[src*="https://test.com/test.png"]')
    end

    it 'shows the users username' do
      visit("/users/#{@user.id}")
      expect(page).to have_content('aaaa')
    end

    it 'shows number of posts of user has written' do
      visit("/users/#{@user.id}")
      expect(@user.posts_counter).to eql(0)
    end

    it 'shows number of posts by user' do
      visit("/users/#{@user.id}")
      expect(page).to have_content('Total Posts: (3)')
    end

    it 'shows posts title' do
      visit("/users/#{@user.id}")
      expect(page).to have_content('testing')
    end

    it 'can see some of the post detail' do
      visit("/users/#{@user.id}")
      expect(page).to have_content 'Some testing text'
    end

    it 'can see the first comment on a post' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content 'this is my first commnet'
    end

    it 'can see how many comments a post has.' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('Comments: ( 0 )')
    end

    it 'can see how many likes a post has.' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('Likes: ( 0 )')
    end
   end
end

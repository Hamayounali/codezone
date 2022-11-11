require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @user = User.create(
        name: 'ali', photo: 'https://test.com/test.png',
        bio: 'This is some test bio data', posts_counter: 0
      )
      @post = Post.create(
        title: 'First Post', text: 'Some testing text', comments_counter: 0,
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
      @comment = Comment.create(text: 'this is my first commnet', post: @post, author: @user)
    end

    it 'shows posts title' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('First Post')
    end

    it 'shows the person who wrote the post' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('ali')
    end

    it 'shows number of comments' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('Comments: ( 0 )')
    end

    it 'shows number of likes' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('Likes: ( 3 )')
    end

    it 'can see the post\'s body.' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content('Some testing text')
    end

    it 'can see the username of each commentor.' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content '(by: ali)'
    end

    it 'can see the comments of each commentor.' do
      visit("/users/#{@user.id}/posts")
      expect(page).to have_content 'ali : this is my first commnet'
    end
  end
end

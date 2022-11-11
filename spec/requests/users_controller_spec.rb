require 'rails_helper'

RSpec.describe UsersController, type: :request do
  before(:each) do
  @user = User.create(
    name: 'aaaa', photo: 'https://test.com/test.png',
    bio: 'This is some test bio data', posts_counter: 0
  )

  @post = Post.create(
    title: 'testing', text: 'Some testing text', comments_counter: 0,
    likes_counter: 0, author_id: @user.id
  )

  comment = Comment.create(text: ' this is my first commnet', post:@post, author: @user)

end

  describe "GET 'index' page" do
    before(:example) do
      get '/users'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
    it 'The response body should have the correct placeholder text' do
      expect(response.body).to include('New post')
    end
  end

  describe "GET 'show' page" do
    before(:example) do
      get "/users/#{@user.id}"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('aaa')
    end
  end

  describe 'Get post from one user' do
    before(:example) do
      get "/users/#{@user.id}/posts"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:posts)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Total Posts:')
    end
  end

  describe 'Get post from one user details page' do
    before(:example) do
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:post_details)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('New post')
    end
  end
end

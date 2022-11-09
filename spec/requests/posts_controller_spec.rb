require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should render correct template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      get '/'
      expect(response.body).to include('commentsLikes')
    end
  end
end

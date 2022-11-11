require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'body should includes correct placeholder text' do
      get '/'
      expect(response.body).to include('New post')
    end
  end
end

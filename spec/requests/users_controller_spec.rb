require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users#index' do
    it 'returns a 200 OK status' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All users')
    end
  end

  describe 'GET /users#show' do
    it 'returns a 200 status code' do
      user = User.create(name: 'Prosper', posts_counter: 0)
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      user = User.create(name: 'Prosper', posts_counter: 0)
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      user = User.create(name: 'Prosper', posts_counter: 0)
      get user_path(user)
      expect(response.body).to include('All posts by a user')
    end
  end
end

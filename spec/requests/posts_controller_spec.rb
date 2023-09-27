require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts#index' do
    user = User.create(name: 'Prosper', posts_counter: 0)
    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include('List of Posts')
    end
  end

  describe 'GET /posts#show' do
    user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                     bio: 'Teacher from Poland.')
    post = Post.create(title: 'Learning Rails', text: 'This is the second post of Lilly', comments_counter: 0,
                     likes_counter: 0, author_id: user.id)
    it 'should check if respose status is correct' do
      get user_post_path(id: post, user_id: user)
      expect(response).to have_http_status(:success)
    end

    it 'should render the correct template' do
      get user_post_path(id: post, user_id: user)
      expect(response).to render_template(:show)
    end

    it 'check if the response body includes correct placeholder text' do
      get user_post_path(id: post, user_id: user)
      expect(response.body).to include('Post Details')
    end

  end
end

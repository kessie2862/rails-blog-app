require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) do
      User.new(
        name: 'Jennifer',
        photo: 'https://unsplash.com/photos/64YrPKiguAE',
        posts_counter: 0,
        bio: 'Software Developer from Berlin.'
      )
    end

    it 'name should be present' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'post_count to be greater or equal to zero' do
      user.posts_counter = -1
      expect(user).not_to be_valid
    end

    it 'post_count should be a number' do
      user.posts_counter = 'Text'
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many posts' do
      association = User.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many comments' do
      association = User.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many likes' do
      association = User.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe '#recent_posts methods checked' do
    it 'returns the three most recent posts' do
      user = User.create(
        name: 'Jennifer',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        posts_counter: 0,
        bio: 'Software Developer from Berlin.'
      )

      create_post(user, 'Hello World', 'This is my first post', 3.days.ago)
      post2 = create_post(user, 'Hello', 'This is my second post', 2.days.ago)
      post3 = create_post(user, 'Hey there', 'This is my third post', 1.day.ago)
      post4 = create_post(user, 'Hello there', 'This is my fourth post', Time.current)

      recent_post = user.recent_posts.to_a
      expect(recent_post).to eq([post4, post3, post2])
    end

    it 'returns the specified number of recent posts' do
      user = User.create(
        name: 'Jennifer',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        posts_counter: 0,
        bio: 'Software Developer from Berlin.'
      )

      create_post(user, 'Hey', 'This is my fifth post', 3.days.ago)
      create_post(user, 'Hello', 'This is my sixth post', 2.days.ago)
      create_post(user, 'Hey there', 'This is my seventh post', 1.day.ago)
      create_post(user, 'Hello there', 'This is my eighth post', Time.current)

      recent_post = user.recent_posts(4)
      expect(recent_post.size).to eq(4)
    end

    def create_post(author, title, text, created_at)
      Post.create(author:, title:, text:, created_at:)
    end
  end
end

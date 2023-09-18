require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      like = Like.reflect_on_association(:author)
      expect(like.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
    end
  end

  describe 'update_post_likes_counter' do
    user = User.create(name: 'Jennifer', photo: 'https://unsplash.com/photos/64YrPKiguAE',
                       bio: 'Software Developer from Berlin.')
    post = Post.create(title: 'Working with DSA in Javascript.', text: 'This is the first post of third_user author',
                       author: user, comments_counter: 0, likes_counter: 0)
    subject = Like.create(post:, author: user)

    it 'updates post likes counter on the associated post' do
      expect { subject.send(:update_post_likes_counter) }.to change { post.reload.likes_counter }.by(1)
    end
  end
end

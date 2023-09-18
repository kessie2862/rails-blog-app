require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      comment = Comment.reflect_on_association(:author)
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      comment = Comment.reflect_on_association(:post)
      expect(comment.macro).to eq(:belongs_to)
    end
  end

  describe 'update_post_comments_counter' do
    user = User.create(name: 'Jennifer', photo: 'https://unsplash.com/photos/64YrPKiguAE',
                       bio: 'Software Developer from Berlin.')
    post = Post.create(title: 'Working with DSA in Javascript.', text: 'This is the first post of third_user author',
                       author: user, comments_counter: 0, likes_counter: 0)
    subject = Comment.create(post:, author: user, text: 'This is the second comment.')

    it 'Updates the comments counter on the associated post' do
      expect { subject.send(:update_post_comments_counter) }.to change { post.reload.comments_counter }.by(1)
    end
  end
end

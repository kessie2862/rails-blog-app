require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                     bio: 'Teacher from Poland.')
  post = Post.create(title: 'Learning Rails', text: 'This is the second post of Lilly', comments_counter: 0,
                     likes_counter: 0, author_id: user.id)

  describe 'validations' do
    it 'title should be present' do
      post.title = nil
      expect(post.title).to_not eq('')
    end

    it 'comments cannot be less than zero' do
      post.comments_counter = -10
      expect(post.comments_counter).not_to eq(0)
    end

    it 'likes cannot be less than zero' do
      post.likes_counter = -2
      expect(post.likes_counter).not_to eq(0)
    end
  end

  describe 'associations' do
    it 'belongs to author' do
      post = Post.reflect_on_association(:author)
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many likes' do
      post = Post.reflect_on_association(:likes)
      expect(post.macro).to eq(:has_many)
    end

    it 'has many comments' do
      post = Post.reflect_on_association(:comments)
      expect(post.macro).to eq(:has_many)
    end
  end

  describe '#recent_posts methods checked' do
    it 'returns the three most recent comments' do
      user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 0,
                         bio: 'Teacher from Poland.')
      first_post = Post.create(author: user, title: 'Hi, am back', text: 'This is the second post of Lilly',
                               created_at: Time.current)
      Comment.create(post: first_post, author: user, text: 'Comment one!')
      comment2 = Comment.create(post: first_post, author: user, text: 'Comment two!')
      comment3 = Comment.create(post: first_post, author: user, text: 'Comment three!')
      comment4 = Comment.create(post: first_post, author: user, text: 'Comment four!')
      comment5 = Comment.create(post: first_post, author: user, text: 'Comment five!')
      comment6 = Comment.create(post: first_post, author: user, text: 'Comment six!')

      recent_comment = first_post.recent_comments.to_a
      expect(recent_comment).to eq([comment6, comment5, comment4, comment3, comment2])
    end

    it 'returns the specified number of recent comments' do
      user1 = User.create(name: 'Jennifer', photo: 'https://unsplash.com/photos/64YrPKiguAE', posts_counter: 0,
                          bio: 'Software Developer from Berlin.')
      last_post = Post.create(author: user1, title: 'Hello there are you OK', text: 'This is my eighth post',
                              created_at: Time.current)
      Comment.create(post: last_post, author: user1, text: 'Comment one!')
      Comment.create(post: last_post, author: user1, text: 'Comment two!')
      Comment.create(post: last_post, author: user1, text: 'Comment three!')
      Comment.create(post: last_post, author: user1, text: 'Comment four!')

      recent_comment = last_post.recent_comments(2)
      expect(recent_comment.size).to eq(2)
    end
  end

  describe 'update_user_posts_counter' do
    user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.')
    subject = Post.create(title: 'Hello World!', text: 'This is my first post.', author: user2, comments_counter: 0,
                          likes_counter: 0)

    it 'increments the post counter on the associated post' do
      expect { subject.send(:update_user_posts_counter) }.to change { user2.reload.posts_counter }.by(1)
    end
  end
end

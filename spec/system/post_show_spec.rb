require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'Should display post details of a user' do
    user = User.create(name: 'Tom', photo: 'https://bit.ly/48MSO1Y', bio: 'Teacher from Mexico.')

    let!(:posts) do
      Post.create(title: 'Birth rate', text: 'Post content 1', author: user)
    end

    let(:comments) do
      Comment.create(text: 'Second comment for death rate post', author: user, post: posts)
    end

    before do
      visit user_post_path(user, posts)
    end

    it 'Display header text' do
      expect(page).to have_content('Post Details')
    end

    it 'Display post title by an author' do
      expect(page).to have_content("#{posts.title} by #{posts.author.name}")
    end

    it 'Display count of comments and likes' do
      expect(page).to have_content("Comments : #{posts.comments_counter}, Likes : #{posts.likes_counter}")
    end

    it 'Display post text by an author' do
      expect(page).to have_content(posts.text.to_s)
    end

    it 'Display button to like the post' do
      expect(page).to have_button('Like Post')
    end

    it 'like the post' do
      click_button 'Like Post'

      expect(page).to have_current_path(%r{/users/\d+/posts/\d+})

      expect(page).to have_content('You just liked this post')
    end

    it 'Should see the post body.' do
      expect(page).to have_content(posts.text.to_s)
    end

    it 'Should see the username of each commentor.' do
      posts.comments.all.each do |comment|
        expect(page).to have_content(comment.author.name.to_s)
      end
    end

    it 'Should see the comment each commentor left.' do
      posts.comments.all.each do |comment|
        expect(page).to have_content(comment.text.to_s)
      end
    end

    it 'Display button to go back to all posts' do
      expect(page).to have_link('Back to all posts')
    end

    it 'Redirect to user\'s posts' do
      click_link 'Back to all posts'
      expect(page).to have_current_path(%r{/users/\d+/posts})
    end
  end
end

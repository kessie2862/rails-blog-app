require 'rails_helper'

RSpec.describe 'post index page', type: :feature do
  describe 'Should display user and their posts' do
    user = User.create(name: 'Tom', photo: 'https://bit.ly/48MSO1Y', bio: 'Teacher from Mexico.')

    let!(:posts) do
      [
        Post.create(title: 'Post 1', text: 'This is Post 1', author: user),
        Post.create(title: 'Post 2', text: 'This is Post 2', author: user)
      ]
    end

    let(:comments) do
      [
        Comment.create(text: 'Post 1 comment', author: user, post: posts[0]),
        Comment.create(text: 'Post 2 comment', author: user, post: posts[1])
      ]
    end

    before do
      visit user_posts_path(user)
    end

    it 'Display header text' do
      expect(page).to have_content('List of all Posts')
    end

    it 'displays the profile picture for each user' do
      expect(page).to have_css("img[src='#{user.photo}'][alt='user photo']")
    end

    it 'displays number of posts a user has made' do
      expect(page).to have_content("Number of posts: #{posts.count}")
    end

    it 'displays link to new post form' do
      expect(page).to have_link('New Post')
    end

    it 'Display post title in all posts' do
      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'Display post text content in all posts' do
      posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'Displays link to show details of post' do
      expect(page).to have_link('Show details')
    end

    it 'Display pagination link' do
      expect(page).to have_link('Pagination')
    end

    it 'When I click on New post will be redirected to new post form' do
      click_link 'New Post', href: new_post_path
      expect(page).to have_current_path(new_post_path)
    end

    it 'When I click on Show details link, I am redirected to their post show page' do
      click_link 'Show details', href: user_post_path(user, posts[0])
      expect(page).to have_current_path(user_post_path(user, posts[0]))
    end
  end
end

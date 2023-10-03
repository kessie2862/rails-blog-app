require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://bit.ly/48MSO1Y', bio: 'Teacher from Mexico.')

    @post1 = Post.create(author: @user, title: 'Hello', text: 'This is my first post',
                         likes_counter: 0)
    @post2 = Post.create(author: @user, title: 'Learning Rails', text: 'This is the second post of user_1 author',
                         likes_counter: 0)
    @post3 = Post.create(author: @user, title: 'New Week', text: 'It is a beautiful new week.',
                         likes_counter: 0)
  end

  describe 'Page content testing' do
    before(:each) do
      visit user_path(@user)
    end

    it "Should see the user's profile picture." do
      expect(page).to have_selector("img[src='https://bit.ly/48MSO1Y']")
    end

    it "Should see the user's username." do
      expect(page).to have_content(@user.name)
    end

    it 'Should see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "Should see the user's bio." do
      expect(page).to have_content(@user.bio)
    end

    it "Should see the user's first 3 posts." do
      expect(page).to have_content(@post1.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
    end

    it "Should see a button that lets me view all of a user's posts." do
      expect(page).to have_selector("a[href='#{user_posts_path(@user)}']")
    end
  end

  describe 'User interaction testing' do
    before(:each) do
      visit user_path(@user)
    end

    it 'When I click on See all posts, I am redirected to their index page' do
      click_link 'See all posts', href: user_posts_path(@user)
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end

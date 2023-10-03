Comment.delete_all
Like.delete_all
Post.delete_all
User.delete_all

# Create at least 2 Users
user_4 = User.create(name: 'Tom', photo: 'https://bit.ly/48MSO1Y', bio: 'Teacher from Mexico.')
user_5 = User.create(name: 'Lilly', photo: 'https://bit.ly/45fmtOi', bio: 'Teacher from Poland.')
user_6 = User.create(name: 'Jennifer', photo: 'https://bit.ly/45dJP6T', bio: 'Software Developer from Berlin.')

# Create at least 4 Posts
post_1 = Post.create(author: user_4, title: 'Hello', text: 'This is my first post')
post_2 = Post.create(author: user_5, title: 'Hello World!', text: 'This is the first post of Lilly')
post_3 = Post.create(author: user_4, title: 'Learning Rails', text: 'This is the second post of Tom')
post_4 = Post.create(author: user_5, title: 'Learning ORM in Rails', text: 'This is the second post of Lilly')
post_5 = Post.create(author: user_4, title: 'New Week', text: 'It is a beautiful new week.')
post_6 = Post.create(author: user_6, title: 'Working with DSA in Javascript.', text: 'This is the first post of Jennifer')

# Create at least 6 Posts Comments
Comment.create(author: user_5, post: post_1, text: 'Hi Tom!')
Comment.create(author: user_6, post: post_2, text: 'This is the second comment.')
Comment.create(author: user_4, post: post_3, text: 'This is the third comment.')
Comment.create(author: user_4, post: post_4, text: 'This is the fourth comment.')
Comment.create(author: user_6, post: post_5, text: 'This is the fifth comment.')
Comment.create(author: user_5, post: post_6, text: 'This is the sixth comment.')

Like.create(author: User.first, post: Post.first)
Like.create(author: User.second, post: Post.second)
Like.create(author: User.third, post: Post.third)

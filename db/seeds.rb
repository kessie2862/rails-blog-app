# Create at least 2 Users
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Jennifer', photo: 'https://unsplash.com/photos/64YrPKiguAE', bio: 'Software Developer from Berlin.')

# Create at least 4 Posts
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'Hello World!', text: 'This is the first post of second_user author')
third_post = Post.create(author: first_user, title: 'Learning Rails', text: 'This is the second post of first_user author')
fourth_post = Post.create(author: second_user, title: 'Learning ORM in Rails', text: 'This is the second post of second_user author')
fifth_post = Post.create(author: third_user, title: 'Working with DSA in Javascript.', text: 'This is the first post of third_user author')

# Create at least 6 Posts Comments
Comment.create(author: second_user, post: first_post, text: 'Hi Tom!')
Comment.create(author: third_user, post: second_post, text: 'This is the second comment.')
Comment.create(author: first_user, post: third_post, text: 'This is the third comment.')
Comment.create(author: first_user, post: fourth_post, text: 'This is the fourth comment.')
Comment.create(author: third_user, post: third_post, text: 'This is the fifth comment.')
Comment.create(author: second_user, post: fourth_post, text: 'This is the sixth comment.')

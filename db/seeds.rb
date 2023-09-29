Comment.delete_all
Like.delete_all
Post.delete_all
User.delete_all

# Create at least 2 Users
user_1 = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1476&q=80', bio: 'Teacher from Mexico.')
user_2 = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80', bio: 'Teacher from Poland.')
user_3 = User.create(name: 'Jennifer', photo: 'https://images.pexels.com/photos/5212317/pexels-photo-5212317.jpeg?auto=compress&cs=tinysrgb&w=600', bio: 'Software Developer from Berlin.')

# Create at least 4 Posts
post_1 = Post.create(author: user_1, title: 'Hello', text: 'This is my first post')
post_2 = Post.create(author: user_2, title: 'Hello World!', text: 'This is the first post of user_2 author')
post_3 = Post.create(author: user_1, title: 'Learning Rails', text: 'This is the second post of user_1 author')
post_4 = Post.create(author: user_2, title: 'Learning ORM in Rails', text: 'This is the second post of user_2 author')
post_5 = Post.create(author: user_3, title: 'Working with DSA in Javascript.', text: 'This is the first post of user_3 author')

# Create at least 6 Posts Comments
Comment.create(author: user_2, post: post_1, text: 'Hi Tom!')
Comment.create(author: user_3, post: post_2, text: 'This is the second comment.')
Comment.create(author: user_1, post: post_3, text: 'This is the third comment.')
Comment.create(author: user_1, post: post_4, text: 'This is the fourth comment.')
Comment.create(author: user_3, post: post_3, text: 'This is the fifth comment.')
Comment.create(author: user_2, post: post_5, text: 'This is the sixth comment.')

Like.create(author: User.first, post: Post.first)
Like.create(author: User.second, post: Post.second)
Like.create(author: User.third, post: Post.third)

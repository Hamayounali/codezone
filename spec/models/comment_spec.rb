require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(
    name: 'TestName', photo: 'https://test.com/test.png',
    bio: 'This is some test bio data', posts_counter: 0
  )

  post = Post.create(
    title: 'test', text: 'Some testing text', comments_counter: 0,
    likes_counter: 0, author_id: user.id
  )

  comment = Comment.create(post:, author: user)

  context 'update_comments_counter' do
    comment.update_comments_counter

    it ' increment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
  end
end

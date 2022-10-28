class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  def update_likes_counter
    Post.update(likes_counter: Post.first.likes.count)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end

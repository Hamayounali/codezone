class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def update_posts_counter
    User.update(posts_counter: User.first.post.count)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end

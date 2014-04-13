class Post < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable
  acts_as_votable

  default_scope order: 'posts.created_at DESC'
  
end

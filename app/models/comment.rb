class Comment < ActiveRecord::Base


  validates_presence_of :content, :user_id
  belongs_to :topic
  belongs_to :user

end

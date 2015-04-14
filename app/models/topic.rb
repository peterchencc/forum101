class Topic < ActiveRecord::Base

  validates_presence_of :title, :content, :user_id
  has_many :comments

  belongs_to :user
end

class Topic < ActiveRecord::Base

  validates_presence_of :title, :content, :user_id
  has_many :comments, :dependent => :destroy
  belongs_to :user

  has_many :topic_categories
  has_many :categories, :through => :topic_categories

end

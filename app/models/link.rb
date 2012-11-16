class Link < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :url, :title

  belongs_to :user
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :author_name, :body
  validates :author_name, :presence => true
  validates :body, :presence => true
end

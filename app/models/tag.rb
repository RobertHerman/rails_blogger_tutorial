class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :articles, through: :taggings
  validates :name, :presence => true

  def to_s
    name
  end
end

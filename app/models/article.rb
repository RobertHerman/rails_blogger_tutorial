class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :image, :view_count
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :author
  has_attached_file :image
 
  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by_name(name) }
    self.tags = new_or_found_tags
  end

  def add_to_view_count
    self.view_count += 1 unless self.view_count.nil?
    self.view_count = 1 if self.view_count.nil?
    self.save
  end

  def creation_date
    self.created_at
  end

  def self.by_month_and_year(month, year)
    where("strftime('%m', created_at) = ? AND strftime('%Y', created_at) = ?"\
          , month.rjust(2,'0')\
          , year.rjust(2,'0'))
  end
end

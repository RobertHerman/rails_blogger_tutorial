require 'test_helper'

class TagTest < ActiveSupport::TestCase
   test "should not save tag without a tag name" do
     tag = Tag.new()
     assert !tag.save, "Saved the tag without a name"
   end
end

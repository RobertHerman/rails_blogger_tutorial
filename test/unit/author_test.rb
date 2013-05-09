require 'test_helper'

#class AuthorTest < ActiveSupport::TestCase
   #test "should not save author without username" do
     #author = Author.new
     #assert !author.save, "Saved the author without a username"
   #end
#end

class AuthorTest < ActiveSupport::TestCase
   test "username must be unique" do
     author = Author.new
     author.username = "bill@yahoo.com"
     assert author.save, "author name must be unique"

     author = Author.new
     author.username = "bill@yahoo.com"
     assert !author.save, "author name must be unique"
   end
end

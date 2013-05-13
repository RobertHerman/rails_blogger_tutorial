require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
   test "should not save author without username" do
     author = Author.new
     assert !author.save, "Saved the author without a username"
   end
end

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

class AuthorTest < ActiveSupport::TestCase
   test "Author Two should have 2 articles" do
     #note: authors(:author_two) is special fixture syntax that allows these
     #tests for find fixture data from authors.yml based upon its label
     #author_two
     author = authors(:author_two)
     assert author.articles.count == 2, "Did not find 2 articles for author two"
   end
end

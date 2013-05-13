require 'test_helper'

class CommentTest < ActiveSupport::TestCase
   test "should not save comment without a author" do
     comment = Comment.new(body: "Comment Body")
     assert !comment.save, "Saved the comment without a author"
   end
end

class CommentTest < ActiveSupport::TestCase
   test "should not save comment without a comment body" do
     comment = Comment.new(author_name: "Commenter Bob")
     assert !comment.save, "Saved the comment without a comment body"
   end
end

class CommentTest < ActiveSupport::TestCase
   test "should save comment that includes both author and body" do
     comment = Comment.new(author_name: "Commenter Bob", body: "New Comment Body")
     assert comment.save, "Failed to save a valid comment"
   end
end

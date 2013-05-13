require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
   test "should not save article without a title" do
     article = Article.new(body: "Article Body")
     assert !article.save, "Saved the article without a title"
   end
end

class ArticleTest < ActiveSupport::TestCase
   test "should not save article without a body" do
     article = Article.new(title: "New Test Article")
     assert !article.save, "Saved the article without a title"
   end
end

class ArticleTest < ActiveSupport::TestCase
   test "should save article that includes both title and body" do
     article = Article.new(title: "New Test Article",body: "New Test Body")
     assert article.save, "Failed to save a valid article"
   end
end

class ArticleTest < ActiveSupport::TestCase
   test "Article One should have 3 tags" do
     #note: articles(:article_one) is special fixture syntax that allows these
     #tests for find fixture data from articles.yml based upon its label
     #article_one
     article = articles(:article_one)
     assert article.tags.count == 3, "Did not find 3 tags for article one"
   end
end

class ArticleTest < ActiveSupport::TestCase
   test "Article One should have 2 comments" do
     #note: articles(:article_one) is special fixture syntax that allows these
     #tests for find fixture data from articles.yml based upon its label
     #article_one
     article = articles(:article_one)
     assert article.comments.count == 2, "Did not find 2 comments for article one"
   end
end

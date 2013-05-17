Given /^some published articles$/ do
#  Article.where(:published => true)
  FactoryGirl.create_list :published_article, 3
end

Given /^some unpublished articles$/ do
#  Article.where(:published => false)
  FactoryGirl.create_list :unpublished_article, 3
end

When /^I ask for articles from the API$/ do
  header 'Accept', 'application/json'
  get '/articles.json'
end

Then /^I should only receive published articles as JSON$/ do
  articles_json = JSON last_response.body
#  articles_json.should have(6).published_articles
  articles_json.should have(3).published_articles

  published_articles = Article.all.select {|article| article.published?}
  published_articles.should_not be_empty
  published_articles.each do |published_article|
    article_json = articles_json.detect do |article_json|
      article_json['title'] == published_article.title
    end
    article_json.should be
  end
end

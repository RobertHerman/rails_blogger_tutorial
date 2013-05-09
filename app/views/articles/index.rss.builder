xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Rails Tutorial Blogging Website"
    xml.description "A place to learn and blog"
    xml.link articles_url

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link article_url(article)
        xml.guid article_url(article)
      end
    end
  end
end

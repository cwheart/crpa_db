class ArticleContent < ActiveRecord::Base
  attr_accessible :article_id, :content

  belongs_to :article

  def self.migrate_content
    Article.where('id>28244').find_each do |article|
      next unless File.exist?("/www/crpa_ruby/current/txts/#{article.content}")
      next if article.content.blank?
      next if article.article_content.present?
      content_tmp="";
      File.open("/www/crpa_ruby/current/txts/#{article.content}","r") do |file|
        while line = file.gets
          content_tmp << line
        end
      end
      ArticleContent.create(article_id: article.id, content: content_tmp)
    end
  end

  def self.test_migrate_content(test_id)
    article = Article.find(test_id)
    return unless File.exist?("/www/crpa_ruby/current/txts/#{article.content}")
    content_tmp="";
    File.open("/www/crpa_ruby/current/txts/#{article.content}","r") do |file|
      while line = file.gets
        p line
        content_tmp << line
      end
    end
    ArticleContent.create(article_id: article.id, content: content_tmp)
  end
end

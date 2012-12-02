class ArticleContentOrg < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :article_org

  def self.migrate_content
    ArticleOrg.find_each do |article|
      next unless File.exist?("/www/crpa_ruby/current/txts/#{article.content}")
      next if article.content.blank?
      next if article.article_content_org.present?
      content_tmp="";
      File.open("/www/crpa_ruby/current/txts/#{article.content}","r") do |file|
        while line = file.gets
          content_tmp << line
        end
      end
      ArticleOrgContent.create(article_id: article.id, content: content_tmp)
    end
  end

  def self.test_migrate_content(test_id)
    article = ArticleOrg.find(test_id)
    return unless File.exist?("/www/crpa_ruby/current/txts/#{article.content}")
    content_tmp="";
    File.open("/www/crpa_ruby/current/txts/#{article.content}","r") do |file|
      while line = file.gets
        content_tmp << line
      end
    end
    ArticleOrgContent.create(article_id: article.id, content: content_tmp)
  end
end
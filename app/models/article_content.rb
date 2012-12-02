class ArticleContent < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :article

  def migrate_content
    Article.find_each do |article|
      next unless File.File.exist?("/www/crpa_ruby/current/txts/#{article.content}")
      content_tmp="";
      File.open("/www/crpa_ruby/current/txts/#{article.content}","r") do |file|
        while line = file.gets
          content_tmp << line
        end
      end
      ArticleContent.create(article_id: self.id, content: content_tmp)
    end
  end
end

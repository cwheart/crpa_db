class ArticleOrg < ActiveRecord::Base
  # attr_accessible :title, :body

  has_one :article_content_org
end

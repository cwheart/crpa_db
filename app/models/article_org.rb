class ArticleOrg < ActiveRecord::Base
  # attr_accessible :title, :body

  has_one :article_org_content
end

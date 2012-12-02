class ArticleContentOrg < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :article_org
end

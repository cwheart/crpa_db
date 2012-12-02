class Article < ActiveRecord::Base
  # attr_accessible :title, :body

  has_one :article_content
end

namespace :crpa do
  desc "migrate article content to db"
  task :migrate_content => :environment do
    ArticleContent.migrate_content
    ArticleContentOrg.migrate_content
  end
end
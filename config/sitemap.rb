# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://shiokuritai.com"

SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

add "/" , changefreq: 'daily', priority: 1.0
add "guide" , changefreq: 'daily', priority: 0.8 #エンジランス
add "faq" , changefreq: 'daily', priority: 0.8  #ムービーズ
add "co" , changefreq: 'daily', priority: 0.8  #メールマーケティング
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
add "/contact" , changefreq: 'daily', priority: 0.3
add "/lps" , changefreq: 'daily', priority: 0.3

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  add posts_path, :priority => 1.0, :changefreq => 'daily'
  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end

  add lists_path, :priority => 1.0, :changefreq => 'daily'
  List.find_each do |list|
    add list_path(list), :lastmod => list.updated_at
  end

  add companies_path, :priority => 1.0, :changefreq => 'daily'
  Company.find_each do |company|
    add company_path(company), :lastmod => company.updated_at
  end
end

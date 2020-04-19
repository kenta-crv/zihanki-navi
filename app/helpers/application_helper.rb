module ApplicationHelper
  def default_meta_tags
    {
      site: "SMART Document",
      title: "<%= yield(:title) || eatery-japan %>" ,
      description: "東京を中心に美味しいおすすめグルメ探しをするなら！",
      keywords:    "東京 美味しい,おすすめ グルメ,eatery japan",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      #icon: [href: image_url('favicon.ico')]
      # OGPの設定をしておくとfacebook, twitterなどの投稿を見た目よくしてくれます。
    }
  end
end

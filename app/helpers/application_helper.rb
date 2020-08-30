module ApplicationHelper
  def default_meta_tags
    {
      site: "人材紹介会社の一括比較見積もりなら『Comicomi』",
      title:"<%= yield(:title) | Comicomi' %>",
      description: "人材紹介会社の一括比較見積もりなら『Comicomi』。高度人材、未経験人材、外国人人材と企業様のお悩みを人材紹介会社が最安値でサポートします",
      keywords: "人材紹介,一括見積,最安値",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      reverse: true,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('favicon.ico'),  rel: 'apple-touch-icon' },
      ],
	    canonical: request.original_url  # 優先されるurl

    }
  end

end

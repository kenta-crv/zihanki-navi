module ApplicationHelper
  def default_meta_tags
    {
      site: "自動販売機の一括比較見積りなら『自販機ねっと』",
      title:"<%= yield(:title) | 自販機ねっと' %>",
      description: "自動販売機の一括比較見積もりなら『自販機ねっと』。条件の良い自販機会社を手軽に見積りできます。",
      keywords: "自販機　設置,自動販売機　設置",
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

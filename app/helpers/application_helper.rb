module ApplicationHelper
  def default_meta_tags
    {
      site: "国内最大級の弁護士一括比較見積もりなら『士送隊』",
      title:"<%= yield(:title) | 士送隊' %>",
      description: "国内最大級の弁護士一括比較見積もりなら『士送隊』。離婚・養育費問題・慰謝料等・浮気問題等、あなたのお悩みを最適な弁護士が最安値でサポートします",
      keywords: "弁護士,一括見積,最安値",
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

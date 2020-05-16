module ApplicationHelper

  def default_meta_tags
    {
    	title:"<%= yield(:title) || 'テレアポ代行なら中小企業専門の『アポ匠』' %>",
    	description: "中小企業専門のアポ代行・営業アウトソーシングなら『アポ匠』！自社の得意なジャンルをとことん極めたからこそ出来る徹底したリソース・マネジメントで貴社のアポ代行を承ります。",
    	keywords: "アポ代行,テレアポ 代行,営業　アウトソーシング,新規 顧客 獲得",
        canonical: request.original_url,  # 優先されるurl
        charset: "UTF-8"
    }
  end

end

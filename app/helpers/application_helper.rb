module ApplicationHelper
  def google_analytics
    html = ""
      html << "<script type='text/javascript'>"
      html <<   "var _gaq = _gaq || [];"
      html <<   "_gaq.push(['_setAccount', 'UA-38745844-1']);"
      html <<   "_gaq.push(['_trackPageview']);"
      html <<   "(function() {"
      html <<     "var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;"
      html <<     "ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';"
      html <<     "var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);"
      html <<   "})();"
      html << "</script>"
  end
end

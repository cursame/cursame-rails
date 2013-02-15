require 'net/http'
require 'json'
require 'uri'
require 'rexml/document'
require 'redcarpet'
require 'rinku'
require 'action_controller'
require 'cgi'
require 'action_view'
require 'redcarpet'


# AutoHtml.add_filter(:image_with_link).with({}) do |text, options|
#   text.gsub(/https?:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
#     img = ActionView::Base.new.image_tag(match,:width => 300)
#     "<a href=\"#{ERB::Util.html_escape match}\" target=\"_blank\">#{img}</a>"
#   end
# end


AutoHtml.add_filter(:dailymotion).with(:width => 480, :height => 360) do |text, options|
  text.gsub(/http:\/\/www\.dailymotion\.com.*\/video\/(.+)_*/) do
    video_id = $1
    %{<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/#{video_id}&related=0" width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="http://www.dailymotion.com/swf/#{video_id}&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/#{video_id}?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/#{video_id}" width="#{options[:width]}" height="#{options[:height]}"/></a></object>}
  end
end

AutoHtml.add_filter(:flickr).with(:maxwidth => nil, :maxheight => nil, :link_options => {}) do |text, options|
  regex = %r{http://(www\.)?flickr\.com/photos/[^\s<]*}

  text.gsub(regex) do |match|
    params = { :url => match, :format => "json" }
    [:maxwidth, :maxheight].each { |p| params[p] = options[p] unless options[p].nil? or not options[p] > 0 }

    uri = URI("http://www.flickr.com/services/oembed")
    uri.query = URI.encode_www_form(params)

    response = JSON.parse(Net::HTTP.get(uri))

    link_options = Array(options[:link_options]).reject { |k,v| v.nil? }.map { |k, v| %{#{k}="#{REXML::Text::normalize(v)}"} }.join(' ')
    %{<a href="#{match}"#{ ' ' + link_options unless link_options.empty? }><img src="#{response["url"]}" alt="#{response["title"]}" title="#{response["title"]}" /></a>}
  end
end

# encoding: UTF-8
AutoHtml.add_filter(:google_map).with(:width => 420, :height => 315, :style => "color:#000;text-align:left", :link_text => "View Larger Map") do |text, options|
  regex = /(https?):\/\/maps\.google\.([a-z]{2,3})\/maps\?(.*)/
  text.gsub(regex) do
    domain_country = $2
    map_query = $3
    width = options[:width]
    height = options[:height]
    style = options[:style]
    link_text = options[:link_text]
    %{<iframe width="#{width}" height="#{height}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.#{domain_country}/maps?f=q&amp;source=s_q&amp;#{map_query}&amp;output=embed"></iframe><br /><small><a href="//maps.google.co#{domain_country}/maps?f=q&amp;source=embed&amp;#{map_query}" style="#{style}">#{link_text}</a></small>}
  end
end

AutoHtml.add_filter(:google_video).with(:width => 650, :height => 391) do |text, options|
  text.gsub(/http:\/\/video\.google\.com\/videoplay\?docid\=(-?[0-9]*)[&\w;=\+_\-]*/) do
    docid = $1
    %{<object width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="http://video.google.com/googleplayer.swf?docid=#{docid}&hl=en&fs=true"></param><param name="wmode" value="transparent"></param><embed src="http://video.google.com/googleplayer.swf?docid=#{docid}" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}"></embed></object>}
  end
end

AutoHtml.add_filter(:html_escape).with(
  :map => { 
    '&' => '&amp;',  
    '>' => '&gt;',
    '<' => '&lt;',
    '"' => '&quot;' }) do |text, options|

  text.to_s.gsub(/[&"><]/) { |special| options[:map][special] }
end


class NoParagraphRenderer < ::Redcarpet::Render::XHTML
  def paragraph(text)
    text
  end    
end

AutoHtml.add_filter(:image).with({:alt => ''}) do |text, options|
  r = Redcarpet::Markdown.new(NoParagraphRenderer)
  alt = options[:alt]
  text.gsub(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    r.render("![#{alt}](#{match})")
  end
end

AutoHtml.add_filter(:link).with({}) do |text, options|
  attributes = Array(options).reject { |k,v| v.nil? }.map { |k, v| %{#{k}="#{REXML::Text::normalize(v)}"} }.join(' ')
  Rinku.auto_link(text, :all, attributes)
end

AutoHtml.add_filter(:metacafe).with(:width => 440, :height => 272, :show_stats => false, :autoplay => false) do |text, options|
  text.gsub(/http:\/\/www\.metacafe\.com\/watch\/([A-Za-z0-9._%-]*)\/([A-Za-z0-9._%-]*)(\/)?/) do
    metacafe_id = $1
    metacafe_slug = $2
    width  = options[:width]
    height = options[:height]
    show_stats      = options[:show_stats] ? "showStats=yes" : "showStats=no"
    autoplay        = options[:autoplay] ? "autoPlay=yes" : "autoPlay=no"
    flash_vars = [show_stats, autoplay].join("|")

    %{<div style="background:#000000;width:#{width}px;height:#{height}px"><embed flashVars="playerVars=#{flash_vars}" src="http://www.metacafe.com/fplayer/#{metacafe_id}/#{metacafe_slug}.swf" width="#{width}" height="#{height}" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_#{metacafe_id}" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>}
  end
end

AutoHtml.add_filter(:redcarpet).with(:renderer => Redcarpet::Render::HTML, :markdown_options => {}) do |text, options|
  Redcarpet::Markdown.new(options[:renderer], options[:markdown_options]).render(text)
end

AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  HTML::WhiteListSanitizer.new.sanitize(text, options)
end

AutoHtml.add_filter(:simple_format).with({}) do |text, html_options|
  args = [text, {}, {:sanitize => false}]
  begin
    ActionView::Base.new.simple_format(*args) 
  rescue ArgumentError
    # Rails 2 support
    args.pop
    retry
  end
end

AutoHtml.add_filter(:soundcloud).with({}) do |text, options|
  # set these options
  # :maxwidth => '', :maxheight => '', :auto_play => false, :show_comments => false
  text.gsub(/(https?:\/\/)?(www.)?soundcloud\.com\/.*/) do |match|
    new_uri = match.to_s
    new_uri = (new_uri =~ /^https?\:\/\/.*/) ? URI(new_uri) : URI("http://#{new_uri}")
    new_uri.normalize!

    uri = URI("http://soundcloud.com/oembed")
    params = {:format => 'json', :url => new_uri}.merge(options)
    uri.query = params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')
    response = Net::HTTP.get(uri)
    if !response.blank?
      JSON.parse(response)["html"]
    else
      match
    end
  end
end

AutoHtml.add_filter(:twitter).with({}) do |text, options|
  regex = %r{https://twitter\.com(/#!)?/[A-Za-z0-9_]{1,15}/status(es)?/\d+}

  text.gsub(regex) do |match|
    params = { :url => match }.merge(options)

    uri = URI("http://api.twitter.com/1/statuses/oembed.json")
    uri.query = URI.encode_www_form(params)

    response = JSON.parse(Net::HTTP.get(uri))
    response["html"]
  end
end

AutoHtml.add_filter(:vimeo).with(:width => 440, :height => 248, :show_title => false, :show_byline => false, :show_portrait => false) do |text, options|
  text.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    width  = options[:width]
    height = options[:height]
    show_title      = "title=0"    unless options[:show_title]
    show_byline     = "byline=0"   unless options[:show_byline]  
    show_portrait   = "portrait=0" unless options[:show_portrait]
    frameborder     = options[:frameborder] || 0
    query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
    query_string    = "?" + query_string_variables unless query_string_variables.empty?

    %{<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"></iframe>}
  end
end

AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil) do |text, options|
  regex = /https?:\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
  text.gsub(regex) do
    youtube_id = $3
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    wmode = options[:wmode]
    src = "//www.youtube.com/embed/#{youtube_id}"
    src += "?wmode=#{wmode}" if wmode
    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
  end
end

AutoHtml.add_filter(:youtube_js_api).with(:width => 390, :height => 250) do |text, options|
  text.gsub(/https?:\/\/(www.)?youtube\.com\/watch\?v=([A-Za-z0-9._%-]*)(\&\S+)?/) do
    youtube_id = $2
    %{<object width="#{options[:width]}" height="#{options[:height]}"><param name="movie" value="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer"></param><param name="wmode" value="transparent"></param><param name="allowscriptaccess" value="always"></param><embed src="//www.youtube.com/v/#{youtube_id}?enablejsapi=1&playerapiid=ytplayer" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}" allowscriptaccess="always"></embed></object>}
  end
end

AutoHtml.add_filter(:ustream_support).with(:width => 400) do |text, options|
  text.gsub(/https?:\/\/(www\.|)ustream\.tv\/channel\/(.+)/) do
    channel = $2
    url = URI.parse("http://api.ustream.tv/json/channel/#{channel}/getCustomEmbedTag?key=31FDCB7300AAE3F5AD7E4302B4FE1E0C&params=autoplay:false;mute:false;width:#{options[:width]}")
    req = Net::HTTP::Get.new(url.request_uri)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        html = JSON.parse(res.body)["results"]
      else
        html = text
    end
    %{#{html}}
  end
end
  
AutoHtml.add_filter(:slideshare_support).with(:width => 400) do |text, options|
  text.gsub(/https?:\/\/(www\.|)slideshare\.net\/(.+)\/(.+)/) do
    url = URI.parse("http://www.slideshare.net/api/oembed/2?url=#{text}&format=json&maxwidth=#{options[:width]}")
    req = Net::HTTP::Get.new(url.request_uri)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        html = JSON.parse(res.body)["html"]
      else
        html = text
    end
    %{#{html}}
  end
end

AutoHtml.add_filter(:prezi_with_wmode).with(:width => 400, :height => 360) do |text, options|
  text.gsub(/https?:\/\/(www\.|)prezi\.com\/(.+)\/(.+)/) do
    user = $2
    %{<object id="prezi_#{user}" name="prezi_#{user}" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="#{options[:width]}" height="#{options[:height]}"><param name="wmode" value="transparent"></param><param name="movie" value="http://prezi.com/bin/preziloader.swf"/><param name="allowfullscreen" value="true"/><param name="allowscriptaccess" value="always"/><param name="bgcolor" value="#ffffff"/><param name="flashvars" value="prezi_id=#{user}&amp;lock_to_path=1&amp;color=ffffff&amp;autoplay=no&amp;autohide_ctrls=0"/><embed id="preziEmbed_#{user}" name="preziEmbed_#{user}" src="http://prezi.com/bin/preziloader.swf" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="400" bgcolor="#ffffff" flashvars="prezi_id=#{user}&amp;lock_to_path=1&amp;color=ffffff&amp;autoplay=no&amp;autohide_ctrls=0"></embed></object>}
  end
end

AutoHtml.add_filter(:livestrem_support).with(:width => 400, :height => 360) do |text, options|
  text.gsub(/https?:\/\/(www\.|)livestream\.com\/(.+)/) do
    user = $2
    %{<object width="#{options[:width]}" height="#{options[:height]}" id="lsplayer" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"><param name="movie" value="http://cdn.livestream.com/grid/LSPlayer.swf?channel=#{user}&amp;autoPlay=false"></param><param name="allowScriptAccess" value="always"></param><param name="allowFullScreen" value="true"></param><embed name="lsplayer" wmode="transparent" src="http://cdn.livestream.com/grid/LSPlayer.swf?channel=#{user}&amp;autoPlay=false" width="#{options[:width]}" height="#{options[:height]}" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash"></embed></object><div style="font-size: 11px;padding-top:10px;text-align:center;width:560px">Watch <a href="http://www.livestream.com/?utm_source=lsplayer&amp;utm_medium=embed&amp;utm_campaign=footerlinks" title="live streaming video">live streaming video</a> from <a href="http://www.livestream.com/#{user}?utm_source=lsplayer&amp;utm_medium=embed&amp;utm_campaign=footerlinks" title="Watch #{user} at livestream.com">#{user}</a> at livestream.com</div>}
  end
end


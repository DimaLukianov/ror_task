module ApplicationHelper
  def callout(type, info)
    if info.class.to_s == 'Hash'
      title = info[:title] || info['title'] || type.to_s.capitalize
      message = info[:message] || info['message']
      link = info[:link] || info['link']
    else
      title = type.to_s.capitalize
      message = info
      link = nil
    end
    content_tag(:div, class: "callout small #{type}", data: { closable: '' }) do
      concat(content_tag(:h5, title))
      concat(content_tag(:p, message))
      concat(link_to link[:title] || link['title'],
                     link[:url] || link['url'],
                     link[:options] || link['options']) if link
      concat(
        content_tag(:button, class: 'close-button', data: { close: '' }) do
          concat(content_tag(:i, raw('&times;')))
        end
      )
    end
  end
end

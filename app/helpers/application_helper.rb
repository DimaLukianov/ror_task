module ApplicationHelper
  def callout(type, title, body, link = nil)
    content_tag(:div, class: "callout small #{type}", data: { closable: '' }) do
      concat(content_tag(:h5, title))
      concat(content_tag(:p, body))
      concat(link_to link[:title], lunk[:url], link[:options]) if link
      concat(
        content_tag(:button, class: 'close-button', data: { close: '' }) do
          concat(content_tag(:i, raw('&times;')))
        end
      )
    end
  end
end

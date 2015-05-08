module ApplicationHelper

  def full_title(page_title = '')
    base_title = "live:lyrics"
    if page_title.empty?
      base_title
    elsif @artist
      "#{page_title}"
    else
      "#{page_title} | #{base_title}"
    end
  end

end

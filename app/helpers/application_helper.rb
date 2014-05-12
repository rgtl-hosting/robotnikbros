module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "RobotnikBros"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def copyright
    "&copy; #{Time.zone.now.strftime("%Y")}".html_safe
  end
end

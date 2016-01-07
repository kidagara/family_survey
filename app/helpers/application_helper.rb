module ApplicationHelper
  def full_title(page_title = nil)
    if page_title.present?
      "Wavetronix Family Survey - #{page_title}"
    else
      "Wavetronix Family Survey"
    end
  end
end

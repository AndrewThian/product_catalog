module ApplicationHelper
  def new_category?(path)
    return true if current_page?(path)
  end
end

module ApplicationHelper
  def create_page?(path)
    return true if current_page?(path)
  end

  def active?(path)
    return "active" if current_page?(path)
  end
end

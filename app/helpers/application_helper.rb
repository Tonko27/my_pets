module ApplicationHelper
  def page_title
    title = "My Pets" #サイト名
    title = @page_title + " | " + title if @page_title
    title
  end
end

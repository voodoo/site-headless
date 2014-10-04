module PathHelpers
  def is_page_active(page)
    current_page.url == page ? {:class => 'active'} : {}
  end
end
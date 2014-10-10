module PathHelpers
  def is_page_active(page)
    current_page.url == page ? {:class => 'active'} : {}
  end

  def markdown
    Redcarpet.new(yield).to_html
  end  	
end
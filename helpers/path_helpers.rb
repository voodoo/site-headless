module PathHelpers
  def is_page_active(page)
    current_page.url == page ? {:class => 'active'} : {}
  end
  def is_blog_page?
  	if current_page.url =~ /\/blog\//
  	 {:class => 'active'} 
  	else
  		{}
  	end
  end
  def markdown
    Redcarpet.new(yield).to_html
  end  	
end
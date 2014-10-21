module PathHelpers
  def in_dir_of?(dir)
    if current_page.url =~ /\/#{dir}\//
     {:class => 'active'} 
    else
      {}
    end    
  end
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
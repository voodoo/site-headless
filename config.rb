

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
set :markdown_engine, :redcarpet
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true

configure :development do
  activate :livereload
end

activate :blog do |blog|
  blog.prefix            = "blog"
  blog.permalink         = "{title}.html"
  blog.layout            = "blog"
  blog.tag_template      = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate          = true
  blog.per_page          = 1
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

#sprockets.import_asset '/js/all.js'

# Asset pipeline
#activate :sprockets

# Use relative URLs
activate :relative_assets

set :relative_links, true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end


activate :deploy do |deploy|
  deploy.method = :git

  deploy.build_before = true # default: false

  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end


# activate :deploy do |deploy|
#   deploy.method = :rsync
#   deploy.host   = 'git.vudmaska.com'
#   deploy.path   = '/home/deployer/static/git'
#   # Optional Settings
#   deploy.user  = 'deployer' # no default
#   # deploy.port  = 5309 # ssh port, default: 22
#   # deploy.clean = true # remove orphaned files on remote host, default: false
#   # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
# end

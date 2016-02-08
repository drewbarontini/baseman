# *************************************
#
#   Config
#
# *************************************

# -------------------------------------
#   Global Variables
# -------------------------------------

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# -------------------------------------
#   Helpers
# -------------------------------------

helpers do
  # If you need helpers for use in this file, then you
  # can define them here. Otherwise, they should be defined
  # in `helpers/custom_helpers.rb`.
end

# -------------------------------------
#   Development Configuration
# -------------------------------------

configure :development do
  activate :livereload
  activate :automatic_image_sizes
  activate :directory_indexes
  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 10']
    config.cascade = false
  end
end

# -------------------------------------
#   Build Configuration
# -------------------------------------

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :relative_assets
end

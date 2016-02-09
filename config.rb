# -------------------------------------
#   Layout Changes
# -------------------------------------

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# -------------------------------------
#   Helpers
# -------------------------------------

helpers do
  # If you need helpers for use in this file, then you
  # can define them here. Otherwise, they should be defined
  # in `helpers/custom_helpers.rb`.
end

# -------------------------------------
#   After Configuration
# -------------------------------------

after_configuration do
  @bower_config = JSON.parse( IO.read( "#{ root }/.bowerrc" ) )
  sprockets.append_path File.join root.to_s, @bower_config['directory']
end

# -------------------------------------
#   Development Configuration
# -------------------------------------

configure :development do

  set :css_dir, 'assets/stylesheets'
  set :js_dir, 'assets/javascripts'
  set :images_dir, 'assets/images'
  set :fonts_dir, 'assets/fonts'

  activate :automatic_image_sizes
  activate :directory_indexes
  activate :livereload

  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 10']
    config.cascade = false
  end

end

# -------------------------------------
#   Production Configuration
# -------------------------------------

 configure :production do

  set :css_dir, 'assets/stylesheets'
  set :js_dir, 'assets/javascripts'
  set :images_dir, 'assets/images'
  set :fonts_dir, 'assets/fonts'

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

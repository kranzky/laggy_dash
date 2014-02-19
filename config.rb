set :source, 'website'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :build_dir, 'build'

activate :relative_assets
set :relative_links, true

configure :development do
  activate :livereload
end

configure :build do
  activate :asset_hash, ignore: [/js/]
  activate :minify_css
  activate :minify_javascript
end

ready do
  sprockets.append_path '../src'
end

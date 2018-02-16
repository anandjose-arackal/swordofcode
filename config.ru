require 'rack/jekyll'
require 'yaml'
require 'rack/contrib/try_static'
run Rack::Jekyll.new

use Rack::TryStatic,
    :root => "_site",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

run lambda { |env|
  return [404, {'Content-Type' => 'text/html'}, ['Not Found']]
}

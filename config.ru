require 'rack'
require_relative './app'
require_relative 'lib/middleware/logging'

# Reload source after change
use Rack::Reloader, 0

# Serer all requests beginngin wiht /public
# from the "public" folder
use Rack::Static, urls: ['/public', '/favicon.ico']

# middleware of logging
use Logging

run App.new
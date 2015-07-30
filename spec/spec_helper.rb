require 'bundler/setup'
Bundler.require(:default, :development)

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do
end

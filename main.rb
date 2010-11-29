require 'rubygems'
require 'haml'
require 'sass'
require 'scss'
require 'sinatra'

for type in %w{models routes}
  for file in Dir.glob(File.join(File.dirname(__FILE__), type, '*.rb'))
    require file
  end
end

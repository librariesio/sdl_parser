require 'bundler'

Bundler.require

require_relative 'lib/sdl_parser'

class SdlParserServer < Sinatra::Base
  use Rack::Deflater

  configure do
    set :dump_errors, false
    set :raise_errors, true
    set :show_exceptions, false
  end

  post '/sdl' do
    content_type :json
    SdlParser.new(:runtime, params[:body]).to_json
  end
end

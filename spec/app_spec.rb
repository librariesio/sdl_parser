require_relative 'spec_helper'

describe "parsing endpoints" do
  it "should successfully parse dub.sdl" do
    path = File.expand_path("../fixtures/dub.sdl", __FILE__)
    file = File.open(path).read
    post '/sdl', body: file
    last_response.body.must_include "[{\"name\":\"vibe-d\",\"version\":\"~>0.7.23\",\"type\":\"runtime\"},{\"name\":\"gl3n\",\"version\":\"1.3.1\",\"type\":\"runtime\"},{\"name\":\"derelict-util\",\"version\":\">= 0\",\"type\":\"runtime\"}]"
  end
end

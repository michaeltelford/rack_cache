require 'rack'
require 'rack/cache'
require 'base64'
require_relative 'helpers'

app = Rack::Builder.new do
  use Rack::Cache,
    metastore:   'file:./cache/meta',
    entitystore: 'file:./cache/body',
    verbose:     true

  map '/login' do
    headers = { 'Cache-Control' => 'max-age=10' }
    handler = proc { |env| [200, headers, [
      html(login_form, javascript: encode_password)
    ]]}
    run handler
  end

  map '/auth' do
    handler = proc do |env|
      req = Rack::Request.new(env)
      username = req.params['username']
      password = req.params['password']

      authorised = auth(username, password)
      status, body = authorised ? [200, 'Authorized'] : [401, 'Unauthorized']

      [status, {}, [html(body)]]
    end
    run handler
  end
end

run app

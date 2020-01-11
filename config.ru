require 'rack'
require 'rack/cache'
require_relative 'helpers'

app = Rack::Builder.new do
  use Rack::Cache,
    metastore:   'file:/var/cache/rack/meta',
    entitystore: 'file:/var/cache/rack/body',
    verbose:     true

  map '/login' do
    handler = proc { |env| [200, {}, [body(login_form)]] }
    run handler
  end

  map '/auth' do
    handler = proc do |env|
      req = Rack::Request.new(env)
      username = req.params['username']
      password = req.params['password']

      authorised = auth(username, password)
      status, html = authorised ? [200, 'Authorized'] : [401, 'Unauthorized']

      [status, {}, [body(html)]]
    end
    run handler
  end
end

run app

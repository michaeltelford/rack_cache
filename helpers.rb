
def body(html)
  <<~HTML
  <html>
    <head></head>
    <body>#{html}</body>
  </html>
  HTML
end

def login_form
  <<~HTML
  <br />
  <form method="post" action="/auth">
    <div>
      <label for="username">Username</label>
      <br />
      <input type="text" name="username" id="username">
    </div>
    <div>
      <label for="password">Password</label>
      <br />
      <input type="password" name="password" id="password">
    </div>
    <div>
      <br />
      <input type="submit" value="Login">
    </div>
  </form>
  HTML
end

def auth(username, password)
  return false unless username && password

  (username.downcase == 'admin') && (password == 'Admin101')
end


def html(body, javascript: nil)
  <<~HTML
  <html>
    <head>
      <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
      <meta content="utf-8" http-equiv="encoding">
      #{"<script>#{javascript}</script>" if javascript}
    </head>
    <body>
    #{body}
    </body>
  </html>
  HTML
end

def login_form
  <<~HTML
  <br />
  <form method="post" action="/auth" onsubmit="encodePassword();">
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

def encode_password
  <<~JS
  function encodePassword() {
    const password_el = document.getElementById('password');
    const password = password_el.value;
    const passwordBase64 = btoa(password);
    password_el.value = passwordBase64;
  }
  JS
end

def auth(username, password)
  return false unless username && password

  decoded_password = Base64.decode64(password)
  puts "login: #{username}:#{decoded_password}"

  (username == 'admin') && (decoded_password == 'Admin101')
end

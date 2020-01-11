# Rack Form Cache

A HTTP server application that contains two endpoints, one providing a form and another which processes that form's submission.

## Technical Overview

- HTTP server built using the `rack` gem.
- HTTP caching provided by the `rack-cache` gem.

## Usage

Start the server on [`http://localhost:9393`](http://localhost:9393) with:

    $ bundle exec shotgun

View the login form by browsing to:

> http://localhost:9393/login

The form submission will `base64` the form content and send it to `http://localhost:9393/auth` to be processed, resulting in a `200 OK` or `401 Unauthorized`. Check the server logs for more verbose information.

To test the auth processing, use the following login details to sucessfully login:

- Username: `admin`
- Password: `Admin101`

Anything else will result in a failed login attempt.

## Tests

Run the tests with:

<<<<<<< HEAD
    $ bundle exec rake test
=======
    $ bundle exec ruby test.rb
>>>>>>> 59ae1f9... Initial commit

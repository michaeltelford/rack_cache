# Rack Cache

A demo/spike HTTP server application that contains two endpoints, one providing a form and another which processes that form's submission.

## Technical Overview

- HTTP server built using the `rack` gem.
- HTTP caching provided by the `rack-cache` gem. Since only static HTML is cached, *expiration* (not *validation*) caching is used.
- I tried finding a *form builder* but the results were either Rails specific or just poor; so instead I use `HEREDOCS` to template the HTML. It works (on a small project) but isn't ideal.

## Usage

Start the server on [`http://localhost:9393`](http://localhost:9393) with:

    $ bundle exec shotgun

View the login form by browsing to:

> http://localhost:9393/login

The form submission will `base64` the form content and send it to `http://localhost:9393/auth` to be processed, resulting in a `200 OK` or `401 Unauthorized`.

To test the auth processing, use the following login details to sucessfully login:

- Username: `admin`
- Password: `Admin101`

Anything else will result in a failed login attempt.

Check the server logs for more verbose information about the API and cache handling.

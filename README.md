# Bolt :nut_and_bolt:

Bolt is a simple and fast web proxy living in the Erlang VM. Bolt can be used as a ssl proxy to prevent mixed content warnings on secure pages or to bypass CORS. For example as a SSL image proxy or for client side website scraping.

## Installation

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

or

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Usage

Pipe your requests through

```
http://example.com/?url=<url>
```

## SSL
If you need to use your own certificate:

To launch your application with support for SSL, just place your keyfile and certfile in the priv directory and configure your router with the following options

```Elixir
# my_app/config/prod.exs
use Mix.Config

config :phoenix, MyApp.Endpoint,
  https: [port: 443,
          host: "example.com",
          keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
          certfile: System.get_env("SOME_APP_SSL_CERT_PATH")],
  ...
```

When you include the ``otp_app`` option, ``Plug`` will search within the priv directory of your application. If you use relative paths for ``keyfile`` and ``certfile`` and do not include the ``otp_app`` option, ``Plug`` will throw an error.

You can leave out the ``otp_app`` option if you provide absolute paths to the files.

Example:
```
Path.expand("../../../some/path/to/ssl/key.pem", __DIR__)
```

Source: http://www.phoenixframework.org/v0.9.0/docs/configuration-for-ssl

# http_digex

[![Hex version](https://img.shields.io/hexpm/v/http_digex.svg "Hex version")](https://hex.pm/packages/http_digex) ![Hex downloads](https://img.shields.io/hexpm/dt/http_digex.svg "Hex downloads") [![Build Status](https://semaphoreci.com/api/v1/techgaun/http_digex/branches/master/badge.svg)](https://semaphoreci.com/techgaun/http_digex) [![Coverage Status](https://coveralls.io/repos/github/techgaun/http_digex/badge.svg?branch=master)](https://coveralls.io/github/techgaun/http_digex?branch=master)
> HTTP Digest Auth Library to create auth header to be used with HTTP Digest Authentication

## Installation

You can install this package from hex as:

```elixir
def deps do
  [{:http_digex, "~> 0.0.1"}]
end
```

Or you can choose to install from github as:

```elixir
def deps do
  [{:egaugex, github: "techgaun/http_digex"}]
end
```

## Usage

```elixir
HTTPDigex.create_digest("user", "password", "Admin panel", "/admin.html", "POST")
```

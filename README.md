# Doumi.URI.Query

[![Hex Version](https://img.shields.io/hexpm/v/doumi_uri_query.svg)](https://hex.pm/packages/doumi_uri_query)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/doumi_uri_query/)
[![License](https://img.shields.io/hexpm/l/doumi_uri_query.svg)](https://github.com/nallwhy/doumi_uri_query/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/nallwhy/doumi_uri_query.svg)](https://github.com/nallwhy/doumi_uri_query/commits/main)


<!-- MDOC !-->

`Doumi.URI.Query` is a helper library that supports encoding complicated query of URI.

**도우미(Doumi)** means "helper" in Korean.

## Usage

It's common to send nested maps or lists via query string even though it is not standardized.

`URI.encode_query/2` does not support nested maps or lists and can't be customized to handle that.

`Doumi.URI.Query` supports encoding maps or lists to query string. (only PHP-style now)

```elixir
iex> query = %{"foo" => %{"bar" => 1, "baz" => 2}}
iex> Doumi.URI.Query.encode(query)
"foo%5Bbar%5D=1&foo%5Bbaz%5D=2" # foo[bar]=1&foo[baz]=2

iex> query = %{"foo" => [1, 2, 3]}
iex> Doumi.URI.Query.encode(query)
"foo%5B%5D=1&foo%5B%5D=2&foo%5B%5D=3" # foo[]=1&foo[]=2&foo[]=3
```

## Installation

If [available in Hex](https://hexdocs.pm/doumi_uri_query/), the package can be installed
by adding `doumi_phoenix_svg` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:doumi_uri_query, "~> 0.1.0"}
  ]
end
```

<!-- MDOC !-->

## TODO

- [ ] Support encode list like `"foo=1&foo=2&foo=3"`
- [ ] Support encode list like `"foo=1,2,3"`

## Other Doumi packages

- [Doumi.Phoenix.SVG](https://github.com/nallwhy/doumi_phoenix_svg): A helper library that generates Phoenix function components from SVG files.

## Copyright and License

Copyright (c) 2022 Jinkyou Son (Json)

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the [LICENSE.md](./LICENSE.md) file for more details.

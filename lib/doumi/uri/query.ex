defmodule Doumi.URI.Query do
  @doc """
  Encodes `map_or_keyword` into a query string using `encoding`.

  Compared to `URI.encode_query/2`, `Doumi.URI.Query.encode/2` can encode nested maps and lists.

  `encoding` follows the same rules as `URI.encode_query/2`.

  ## Examples

      iex> query = %{"foo" => 1, "bar" => 2}
      iex> Doumi.URI.Query.encode(query)
      "bar=2&foo=1"

      iex> query = [foo: 1, bar: 2]
      iex> Doumi.URI.Query.encode(query)
      "bar=2&foo=1"

      iex> query = %{"foo" => %{"bar" => 1, "baz" => 2}}
      iex> Doumi.URI.Query.encode(query)
      "foo%5Bbar%5D=1&foo%5Bbaz%5D=2"

      iex> query = %{"foo" => [1, 2, 3]}
      iex> Doumi.URI.Query.encode(query)
      "foo%5B%5D=1&foo%5B%5D=2&foo%5B%5D=3"

  """

  @spec encode(map() | keyword(), :rfc3986 | :www_form) :: String.t()
  def encode(map_or_keyword, encoding \\ :www_form)

  def encode(map, encoding) when is_map(map) do
    to_params(map, [])
    |> List.flatten()
    |> URI.encode_query(encoding)
  end

  def encode(maybe_enumerable, encoding) do
    case Keyword.keyword?(maybe_enumerable) do
      true ->
        keyword = maybe_enumerable
        encode(Map.new(keyword), encoding)

      false ->
        raise ArgumentError, "expected a map or keyword list, got: #{inspect(maybe_enumerable)}"
    end
  end

  defp to_params(map, context) when is_map(map) do
    map
    |> Enum.map(fn {key, value} ->
      to_params(value, [key | context])
    end)
  end

  defp to_params(list, context) when is_list(list) do
    list
    |> Enum.map(fn value ->
      to_params(value, ["" | context])
    end)
  end

  defp to_params(value, context) do
    {to_key(context), to_string(value)}
  end

  defp to_key(context) do
    [h | t] = context |> Enum.reverse()

    h_key = to_string(h)
    t_keys = t |> Enum.map(&"[#{&1}]")

    [h_key | t_keys]
    |> IO.iodata_to_binary()
  end
end

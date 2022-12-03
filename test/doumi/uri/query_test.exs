defmodule Doumi.URI.QueryTest do
  use ExUnit.Case
  doctest Doumi.URI.Query

  test "throw ArgumentError when given not map or keyword list" do
    assert_raise ArgumentError, ~r"expected a map or keyword list", fn ->
      Doumi.URI.Query.encode([1, 2, 3])
    end
  end

  test "should returns the same result of URI.encode_query/2" do
    query = %{"key" => "value with spaces"}

    assert Doumi.URI.Query.encode(query) == URI.encode_query(query)
    assert Doumi.URI.Query.encode(query, :rfc3986) == URI.encode_query(query, :rfc3986)
  end
end

defmodule HTTPDigexTest do
  use ExUnit.Case
  doctest HTTPDigex

  test "random_string/1 creates random string of length X correctly" do
    refute HTTPDigex.random_string(16) == HTTPDigex.random_string(16) # this needs more care
    assert String.length(HTTPDigex.random_string(16)) === 16
  end

  test "create_digest/5 creates auth digest correctly" do
    username = "test"
    password = "pwd"
    realm = "test realm"
    uri = "/someurl"

    auth_digest = HTTPDigex.create_digest(username, password, realm, uri)
    assert Regex.match?(~r/^Digest username="test", realm="test realm", nonce="[0-9a-f]{32}", uri="\/someurl", response="[0-9a-f]{32}", opaque=""$/, auth_digest)
    auth_digest = HTTPDigex.create_digest(username, password, realm)
    assert Regex.match?(~r/^Digest username="test", realm="test realm", nonce="[0-9a-f]{32}", uri="\/", response="[0-9a-f]{32}", opaque=""$/, auth_digest)
    auth_digest = HTTPDigex.create_digest(username, password, realm, uri)
    refute Regex.match?(~r/^Digest username="test", realm="test realm", nonce="[0-9a-f]{32}", uri="\/", response="[0-9a-f]{32}", opaque=""$/, auth_digest)
  end
end

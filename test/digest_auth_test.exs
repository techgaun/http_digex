defmodule HTTPDigexTest do
  use ExUnit.Case
  doctest HTTPDigex

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

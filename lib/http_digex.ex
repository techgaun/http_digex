defmodule HTTPDigex do
  @moduledoc """
  HTTPDigex is a module to create basic digest http auth header.
  Current, it only supports the "MD5" algorithm but future versions will also support "MD5-SESS" algorithm.

  Refs:
  - https://tools.ietf.org/html/rfc2617#section-3
  - https://en.wikipedia.org/wiki/Digest_access_authentication

  You can use this package to create the digest authentication header but you will have to put in the request header using one of the libraries.
  The header key you need to use is `authorization`.

  ## Example
  ```
  import HTTPDigex
  digest_auth = create_digest("user", "password", "/index.html", "Administration")
  # put the digest_auth on your request now
  ```
  """

  @doc """
  Create the digest authentication header value based on username, password, uri, realm and http method

  ## Example
  ```
  HTTPDigex.create_digest("user", "password", "Admin panel", "/admin.html", "POST")
  ```
  """
  @spec create_digest(String.t, String.t, String.t, String.t, String.t) :: String.t
  def create_digest(username, password, realm, uri \\ "/", method \\ "GET") do
    ha1 = :md5
      |> :crypto.hash(Enum.join([username, realm, password], ":"))
      |> Base.encode16
      |> String.downcase
    ha2 = :md5
      |> :crypto.hash(Enum.join([method, uri], ":"))
      |> Base.encode16
      |> String.downcase
    nonce = :md5
      |> :crypto.hash(random_string(16))
      |> Base.encode16
      |> String.downcase
    auth = :md5
      |> :crypto.hash(Enum.join([ha1, nonce, ha2], ":"))
      |> Base.encode16
      |> String.downcase
    "Digest username=\"#{username}\", realm=\"#{realm}\", nonce=\"#{nonce}\", uri=\"#{uri}\", response=\"#{auth}\", opaque=\"\""
  end

  @spec random_string(Integer.t) :: String.t
  defp random_string(length) do
    length
    |> :crypto.strong_rand_bytes
    |> Base.url_encode64
    |> binary_part(0, length)
  end
end

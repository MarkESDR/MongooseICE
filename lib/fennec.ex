defmodule Fennec do
  @moduledoc """
  STUN/TURN servers

  Fennec allows you to start multiple listeners (later called "servers")
  which react to STUN/TURN messages. The only difference between the servers
  is a transport protocol and interface/port pair which a server uses for
  listening to STUN packets.

  Each server is independent, i.e. if one of them crashes the other one should not
  be affected (note: this applies when starting servers using the recommended method -
  via application's configuration. If you hook up a server to your supervision tree
  the behaviour will depend on a server's supervisor configuration).

  Currently only UDP transport is supported. Read more about it in the documentation
  of `Fennec.UDP`.
  """

  @type ip :: :inet.ip_address
  @type portn :: :inet.port_number
end

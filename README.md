elixir-cnode-example
====================

Buildable source, copied directly from
http://www.erlang.org/doc/tutorial/cnode.html
.

Based on https://github.com/arnehilmann/erlang-cnode-example

## Usage

Build

    $ make

Start CNode as server

    $ make start_server

In another terminal, start iex

    $ make start_elixir

Send request with Erlang module (src/complex3.erl)

    iex> :complex3.foo(4)

Send request with Elixir module (src/complex.ex)

    iex> Complex.foo 4

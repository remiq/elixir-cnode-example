defmodule Complex do

  @node :"c1@"

  def foo(x), do:
    call_cnode {:foo, x}
  def bar(y), do:
    call_cnode {:bar, y}

  defp call_cnode(msg) do
    {:ok, hostname} = :inet.gethostname
    hostname = :unicode.characters_to_list(hostname)
    hostname = [Atom.to_charlist(@node) | hostname]
	hostname = List.to_string(hostname)
    send {:any, String.to_atom(hostname)}, {:call, self, msg}
    receive do
      {:cnode, result} -> result
    end
  end
end

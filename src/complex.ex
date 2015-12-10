defmodule Complex do

  @node :"c1@NEWBORN"

  def foo(x), do:
    call_cnode {:foo, x}
  def bar(y), do:
    call_cnode {:bar, y}

  defp call_cnode(msg) do
    send {:any, @node}, {:call, self, msg}
    receive do
      {:cnode, result} -> result
    end
  end
end

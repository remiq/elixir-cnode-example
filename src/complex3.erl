-module(complex3).
-export([foo/1, bar/1]).

foo(X) ->
    call_cnode({foo, X}).
bar(Y) ->
    call_cnode({bar, Y}).

call_cnode(Msg) ->
    {ok, Hostname} = inet:gethostname(),
    {any, list_to_atom(lists:append(["c1@", Hostname]))} ! {call, self(), Msg},
    receive
	{cnode, Result} ->
	    Result
    end.
